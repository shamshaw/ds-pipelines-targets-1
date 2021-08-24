# Retrieve data from ScienceBase by downloading file and saving as .csv

fetch_data <- function(out_file_path,
                       sci_base_ID = '5d925066e4b0c4f70d0d0599',
                       file_name = 'me_RMSE.csv') {
  
  item_file_download(sb_id = sci_base_ID, names = file_name , destinations = out_file_path, overwrite_file = TRUE)
  
  } 