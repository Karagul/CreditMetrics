\name{cm.gain}
\alias{cm.gain}

\title{Computation of simulated profits and losses}

\description{
\code{cm.gain} computes profits or losses, this is done by building the
difference from the reference value and the simulated portfolio values of the
credit positions.
}

\usage{
cm.gain(M, lgd, ead, N, n, r, rho, rating)
}

\arguments{
  \item{M}{one year empirical migration matrix, where the last row gives the
           default class.}
  \item{lgd}{loss given default}
  \item{ead}{exposure at default}
  \item{N}{number of companies}
  \item{n}{number of simulated random numbers}
  \item{r}{riskless interest rate}
  \item{rho}{correlation matrix}
  \item{rating}{rating of companies}
}

\details{
This function uses \code{cm.portfolio} and \code{cm.ref}. By building the
difference of these functions, one gets the profits, if the difference is
positive, or the losses, if the difference is negative.
}

\value{
This functions returns simulated profits or losses.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{Andreas Wittmann \email{andreas\_wittmann@gmx.de}}

\seealso{\code{\link{cm.matrix}}, \code{\link{cm.ref}}, \code{\link{cm.portfolio}}}

\examples{
  N <- 3
  n <- 50000
  r <- 0.03
  ead <- c(4000000, 1000000, 10000000)
  lgd <- 0.45
  rating <- c("BBB", "AA", "B")
  firmnames <- c("firm 1", "firm 2", "firm 3")
  
  # correlation matrix
  rho <- matrix(c(  1, 0.4, 0.6,
                  0.4,   1, 0.5,
                  0.6, 0.5,   1), 3, 3, dimnames = list(firmnames, firmnames),
                  byrow = TRUE)

  # one year empirical migration matrix from standard&poors website
  rc <- c("AAA", "AA", "A", "BBB", "BB", "B", "CCC", "D")
  M <- matrix(c(90.81,  8.33,  0.68,  0.06,  0.08,  0.02,  0.01,   0.01,
                 0.70, 90.65,  7.79,  0.64,  0.06,  0.13,  0.02,   0.01,
                 0.09,  2.27, 91.05,  5.52,  0.74,  0.26,  0.01,   0.06,
                 0.02,  0.33,  5.95, 85.93,  5.30,  1.17,  1.12,   0.18,
                 0.03,  0.14,  0.67,  7.73, 80.53,  8.84,  1.00,   1.06,
                 0.01,  0.11,  0.24,  0.43,  6.48, 83.46,  4.07,   5.20,
                 0.21,     0,  0.22,  1.30,  2.38, 11.24, 64.86,  19.79,
                    0,     0,     0,     0,     0,     0,     0, 100
              )/100, 8, 8, dimnames = list(rc, rc), byrow = TRUE)
              
  cm.gain(M, lgd, ead, N, n, r, rho, rating)
}

\keyword{models}
