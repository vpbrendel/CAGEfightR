% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bw.R
\name{bwGenomeCompatibility}
\alias{bwGenomeCompatibility}
\title{Check if BigWig-files are compatible with a given genome.}
\usage{
bwGenomeCompatibility(plusStrand, minusStrand, genome)
}
\arguments{
\item{plusStrand}{BigWigFileList: BigWig files with plus-strand CTSS data.}

\item{minusStrand}{BigWigFileList: BigWig files with minus-strand CTSS data.}

\item{genome}{Seqinfo: Genome information.}
}
\value{
TRUE, raises an error if the supplied genome is incompabtible.
}
\description{
Given a genome, checks whether a series of BigWig-files are compatible by
checking if all common seqlevels have equal seqlengths.
}
\examples{
# Use the BigWig-files included with the package:
data('exampleDesign')
bw_plus <- system.file('extdata', exampleDesign$BigWigPlus,
                       package = 'CAGEfightR')
bw_minus <- system.file('extdata', exampleDesign$BigWigMinus,
                        package = 'CAGEfightR')

# Create two named BigWigFileList-objects:
bw_plus <- BigWigFileList(bw_plus)
bw_minus <- BigWigFileList(bw_minus)
names(bw_plus) <- exampleDesign$Name
names(bw_minus) <- exampleDesign$Name

# Make a smaller genome:
si <- seqinfo(bw_plus[[1]])
si <- si['chr18']

# Check if it is still compatible:
bwGenomeCompatibility(plusStrand=bw_plus, minusStrand=bw_minus, genome=si)
}
\seealso{
Other BigWig functions: \code{\link{bwCommonGenome}},
  \code{\link{bwValid}}
}
\concept{BigWig functions}
