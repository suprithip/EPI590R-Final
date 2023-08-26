install.packages("usethis")
usethis::use_git_config(user.name="Suprithi Pingle", use.email="suprithi.pingle@gmail.com")
usethis::create_github_token()
gitcreds::gitcreds_set()
install.packages("here")
load(file='opt.rda')
here::here()
library(gtsummary)
tbl_summary(
	opt,
	by=Clinic,
	include=c(Group, Age, Black, White, Nat.Am, Asian, Hisp, Education
	))
logistic_model<-glm(Group~Age+Education, data=opt, family = binomial())
tbl_regression(
	logistic_model,
	exponentiate =TRUE,
	label = list(
		Age ~ "Age of Women",
		Education ~ "Level of Education"
	))
