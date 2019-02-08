# Japanese Text Data source:
# https://www.aozora.gr.jp/
# Japan Energy Plan Prerelease
download.file("http://www.enecho.meti.go.jp/committee/council/basic_policy_subcommittee/pdf/basic_policy_subcommittee_002.pdf",
              tempfile("jp_energy_draft.pdf"))
pages <- pdftools::pdf_text(tempfile("jp_energy_draft.pdf"))
readr::write_rds(
  c(
    pages[1:2],
    stringr::str_remove_all(
      unlist(
        strsplit(
          stringr::str_replace_all(
            stringr::str_c(pages[3:105], collapse = ""),
            "\n\\s+\\d+\n",
            "\n"
          ),
          "\n "
        )
      ),
      stringr::fixed("\n")
    ),
    pages[106:length(pages)]
  ),
  "./data/japan_energy_plan_pre.rds"
)

# Japan Energy Plan
download.file("http://www.meti.go.jp/press/2018/07/20180703001/20180703001-1.pdf",
              "jp_energy.pdf")
pages <- pdftools::pdf_text("jp_energy.pdf")
readr::write_rds(
  c(
    pages[1:2],
    stringr::str_remove_all(
      unlist(
        strsplit(
          stringr::str_replace_all(
            stringr::str_c(pages[3:length(pages)], collapse = ""),
            "\n\\s+\\d+\n",
            "\n"
          ),
          "\n "
        )
      ),
      stringr::fixed("\n")
    )
  ),
  "./data/japan_energy_plan.rds"
)
