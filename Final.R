install.packages("usethis")
usethis::use_git_config(user.name="Suprithi Pingle", use.email="suprithi.pingle@gmail.com")
usethis::create_github_token()
gitcreds::gitcreds_set()
install.packages("here")
load(file='opt.rda')
here::here()
#descriptive statistics
library(gtsummary)
tbl_summary(
	opt,
	by=Clinic,
	include=c(Group, Age, Black, White, Nat.Am, Asian, Hisp, Education
	))
#regression model
logistic_model<-glm(Group~Age+Education, data=opt, family = binomial())
tbl_regression(
	logistic_model,
	exponentiate =TRUE,
	label = list(
		Age ~ "Age of Women",
		Education ~ "Level of Education"
	))
#regression model w/broom
library(broom)
glance(logistic_model, conf.int=TRUE, exponentiate=TRUE)
#figure
boxplot(opt$Age~opt$Clinic,
				xlab="Clinic",
				ylab="Age",
				main="Participants Ages by Clinic")
#function: Calculate Average Qualifying Teeth Among Those Who Received Treatment
city<-function(x,y,multiplier=100){
new_val=multiplier*sum(x)/sum(y)
return(new_val)
}
city(opt$Clinic=="NY",opt$Group=="T")
