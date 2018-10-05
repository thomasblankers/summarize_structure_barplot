# summarize_structure_barplot
This R function takes the output (deme assignment, i.e. Q matrix)  from STRUCTURE, averages over iterations, and creates a barplot of the averages across iterations.

The input data should have some columns with sample information followed by the columns with the inferred ancestry of individuals grouped by deme. For example (column headers only):

individual  name  population  deme1_iteration1  deme1_iteration2 deme2_iteration1 dem2_iteration2

The number and names of the columns with sample information is not important for this function, as long as the population or sample location information is always in a column named "population". The order of the columns with data is fixed and cannot be interspersed with other columns.

The parameters and options are as follows:

qmatrix: the data frame
k: the number of inferred demes
iter: the number of iterations (default =3)
population_info: whether population/sample location info should be shown on the x-axis (a column named "population" is required in that case; default=TRUE)
color: either a vector with k colors or "default", in which case colors will be set by palette(rainbow(k))
first_data_col: the first column with ancestry data (default=4)
bar_space: the space between the individual bars, If 0, the bars are collated (default=0)
print_matrix: if the matrix with average inferred ancestry over iterations used to create the barplot should be printed to a data frame (default=TRUE)
