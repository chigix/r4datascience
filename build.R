files <- (files <- list.files(
  path = "./rmds",
  pattern = "*.Rmd",
  full.names = TRUE,
  recursive = TRUE
))[! files %in% list.files(
  path = "./rmds",
  pattern = "^_",
  full.names = TRUE,
  recursive = TRUE
)]

lapply(files, function(filename) {
  result <- rmarkdown::render(
    input = filename,
    output_format = rmarkdown::html_fragment(df_print = "paged"),
    output_dir = "./docs/source/_posts/"
  )
  result_raw <- readr::read_lines_raw(result[1])
  readr::write_lines(
    c(
      rmarkdown:::partition_yaml_front_matter(
        readr::read_lines(filename)
      )$front_matter,
      ""
    ),
    result[1]
  )
  readr::write_lines(
    result_raw,
    path = result[1],
    append = TRUE
  )
})

