results <- PubMedScrapeR::PubMedScrapeR(keyword = c("Shan Sabri", "asdfjkj;", "Nanog"), top_n = 2000, verbose = FALSE)
# 2019-08-09 15:47:59 - Shan Sabri
# 2019-08-09 15:48:01 - asdfjkj;
# 2019-08-09 15:48:02 - asdfjkj; - No abstracts found!
# 2019-08-09 15:48:02 - Nanog

lapply(results, head, n = 20)
# [[1]]
# Shan Sabri_6
# cell                     20
# cells                    12
# somatic                   8
# expression                7
# pluripotency              7
# stem                      7
# gata6                     6
# hescs                     6
# naive                     6
# osk                       6
# cardiac                   5
# development               5
# enhancer                  5
# reprogramming             5
# tfs                       5
# cardiomyocytes            4
# embryonic                 4
# cellular                  3
# cycle                     3
# discrete                  3
#
# [[2]]
# [1] NA
#
# [[3]]
# Nanog_5200
# cells                21642
# cell                 12799
# stem                 10404
# expression            9886
# cancer                4558
# differentiation       4459
# oct4                  4336
# pluripotency          3902
# genes                 3776
# embryonic             3665
# markers               3573
# sox2                  3396
# gene                  2962
# pluripotent           2740
# factors               2573
# transcription         2503
# tumor                 2201
# induced               2160
# protein               2095
# mouse                 2020
