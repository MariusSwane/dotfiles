#==============================================================================#
#									       #
#	   ██████╗ ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗	       #
#	   ██╔══██╗██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝	       #
#	   ██████╔╝██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗  	       #
#	   ██╔══██╗██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝  	       #
#	██╗██║  ██║██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗	       #
#	╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝	       #
#									       #
#==============================================================================#

#==============================================================================#
#	Set CRAN mirror to Oslo	       					       #
#==============================================================================#

options(repos=c(CRAN="https://cran.uib.no/"))

#==============================================================================#
#	Making sure to only run when started interactivly   		       #
#==============================================================================#

if (interactive()) {

#==============================================================================#
#	Load packages							       #
#==============================================================================#

library(rmarkdown)
#library(colorout)

#==============================================================================#
#	Aliases 							       #
#==============================================================================#	

Syu <- function(ask = "F", ...) {
	update.packages(ask = ask, ...)
}

q <- function (save = "no", ...) {
  quit(save = save, ...)
}
#==============================================================================#
#	Customizing prompt				   		       #
#==============================================================================#

options(prompt = "-> ", continue = "... ")

#==============================================================================#
#	Misc								       #
#==============================================================================#

# Enables tab-complete package names for use in "library()"
#utils::rc.settings(ipck=TRUE)

# Disable GUI pop-ups and such
options(menu.graphics=FALSE)

# Penalty applied to inhibit the use of scientific notation
options(scipen = 2)

local({
# Detect the number of cores available for use in parallelisation
  n <- max(parallel::detectCores() - 2L, 1L)
  # Parallel package installation in install.packages()
  options(Ncpus = n)                                          
  # Parallel apply-type functions via 'parallel' package
  options(mc.cores =  n)                                
})

# Post-mortem debugging facilities
error <- quote(dump.frames("${R_HOME_USER}/testdump", TRUE))  

message("*** Successfully loaded personal .Rprofile ***\n")

# Ending if-loop
}
