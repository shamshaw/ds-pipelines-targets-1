library(targets)

source("1_fetch/src/fetch_data.R")
source("2_process/src/prep_data.R")
source("3_visualize/src/viz_data.R")

tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))

list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_data(out_file_path = "1_fetch/out/model_RMSEs.csv"),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    prep_data(in_file_path = model_RMSEs_csv),
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    save_data(eval_data, out_file_path = "2_process/out/model_summary_results.csv"), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    make_log_file(eval_data, out_file_path = "2_process/out/model_diagnostic_text.txt"),
    format = "file"
  ),
  # Create a plot
  tar_target(
    figure_1_png,
    plot_model_compare(eval_data, out_file_path = "3_visualize/out/figure_1.png"), 
    format = "file"
  )
)


