#' Create all XML files for direct upload of metadata to InPort.
#'
#' This function calls both \code{create_itemxml} and \code{create_entityxml} functions (internal) to
#' generate two separate XML files. As InPort is currently configured, the two XML files
#' must be uploaded in separate steps, and both are necessary for successful upload.
#'
#'
#' @param inFile The full path to the metadata template (unless in current working directory) (e.g. "Master_Template.xlsx").
#' @param outPath The path to the directory where output file should be saved. Default(current working directory)
#' @param outFile An identifying name for output files (e.g. "CHL_metadata_V1.xml".)
#'
#' @return Nothing
#'
#' Two XML files are created; one for the master XML and one for Entity XML. The filenames
#' will be concatenated with "master_" and "entity_"  and saved in directory specified by \code{outPath}
#'
#'@section Please note:
#'
#'The Master_Template.xlsx file is part of the package. It is installed wherever your packages get installed on your computer.
#'To find where packages are installed on your machine, type \code{.libPaths()} on the commad line. Navigate to this folder to find \code{inportxml} and
#'then copy this file into your current working directory.
#'
#'Alternatively you can run the function \code{copy_master_to_wd}. The copying will be done automatically for you.
#'
#' @examples
#' \dontrun{
#' #Be sure that inFile refers to the full path of the metadata template unless it is saved in your current working directory.
#' create_inportxml(inFile = "Master_Template.xlsx", outPath = paste(getwd(),"/output"), outFile = "X_metadata_V1.xml")
#' This assumes that Master_Template.xlsx resides in your current working directory. Two files are created:
#'  (master_X_metadata_V1.xml and entity_X_metadata_V1.xml) in the folder called "output" in your current working directory.
#'}
#'
#'@seealso \code{\link{copy_master_to_wd}}
#'
#' @export

create_inportxml <- function(inFile,outPath=getwd(),outFile) {

  masterXML_filename <- paste0("master_",outFile)
  entityXML_filename <- paste0("entity_",outFile)

  create_itemxml(inFile,outFile=paste0(outPath,"/",masterXML_filename))
  create_entityxml(inFile,outFile=paste0(outPath,"/",entityXML_filename))


}


