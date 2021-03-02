# Load and save example data
maindir = "C:/Users/kabaldry/OneDrive - University of Tasmania/Documents/SOOS"
filename = file.path(maindir, "file_examples", "SOOSWG_file_22022020.csv")
outdir = file.path(maindir, "output","style1")
lookupfile = file.path(maindir, "file_examples", "country_lookup_table.txt")
inst_LT =  file.path(maindir, "file_examples", "Mapping institutes.csv")
cat_table = file.path(maindir, "file_examples", "Category_example_file.csv")

### WG data
# read the file
data = read.csv(filename, header = T,  stringsAsFactors = F)
colnames(data) = gsub("ï..","",colnames(data)) # this is a bug that can occur from excel (yay excel)
example_WG_data = data

### Country lookup table
# read the lookup file
country_LT = read.csv(lookupfile, header = T, stringsAsFactors = F,strip.white = T)
example_country_data = country_LT

### WG and institution data
example_institution_data = read.csv(inst_LT, header = T, stringsAsFactors = F,strip.white = T)
colnames(example_institution_data) = gsub("ï..","",colnames(example_institution_data)) # this is a bug that can occur from excel (yay excel)

### Country category data
example_category_data = read.csv(cat_table, header = T, stringsAsFactors = F,strip.white = T)
colnames(example_category_data) = gsub("ï..","",colnames(example_category_data)) # this is a bug that can occur from excel (yay excel)


save(example_WG_data, example_country_data, example_institution_data, example_category_data, file = "C:/Users/kabaldry/OneDrive - University of Tasmania/Documents/R_packages/mapSOOSWG/data/ExampleData.rda")
