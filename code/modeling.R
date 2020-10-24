data = read.csv("../data/BodyFat.csv")
pdf("../image/plots.pdf")
index = c()
for(i in 1:length(data))
{
  index = c(index,which(is.element(data[,i], boxplot(data[,i],plot=FALSE)$out)==1))
}
index = sort(unique(index))

data = data[-index,]

plot(1/(data$WEIGHT/data$HEIGHT^2/data$ADIPOSITY),ylab = "Adiposity*Height^2/Weight")
index = which(abs(1/(data$WEIGHT/data$HEIGHT^2/data$ADIPOSITY)-700)>50)
data = data[-index,]

selected_WEIGHT = data[,c('WEIGHT')] <300
selected_BODYFAT = data[,c('BODYFAT')]> 2 & data[,c('BODYFAT')]< 45
selected_HEIGHT = data[,c('HEIGHT')] > 30
selected_item = which(selected_WEIGHT&selected_HEIGHT&selected_BODYFAT)
data = data[selected_item,]


data = data[,-c(1,3)]
baseline = lm(BODYFAT~.,data = data)
cooksd = cooks.distance(baseline)
plot(cooksd,ylab = "Cook's Distance")
abline(h = 4*mean(cooksd, na.rm=T), col="red")
index = which(cooksd>=4*mean(cooksd, na.rm=T))
#index = which(cooksd>=0.03)

n=dim(model.matrix(baseline))[1]
p=dim(model.matrix(baseline))[2]
plot(abs(dffits(baseline)),ylab = "DFFITS")
abline(h=1,col='red')
abline(h=2*sqrt(p/n),col='green')
index = c(index,which(abs(dffits(baseline))>1))
index = sort(unique(index))
data = data[-index,]

model0 = lm(BODYFAT~1,data = data)
model2 = lm(BODYFAT~.*.*.,data = data)
model1 = lm(BODYFAT~.*.,data = data)

modelAIC = step(model0, scope=list(upper = model1,lower = model0), direction="both",trace = 0)

#modelBIC = step(model0, scope=list(upper = model1,lower = model0), direction="both",trace = 0,k=log(length(data$BODYFAT)) )

summary(modelAIC)


plot(predict(modelAIC),rstandard(modelAIC),type="p",pch=19,main = "Standardized Residuals vs Fitted Values",xlab = "Fitted values",ylab = "Standardized residuals")
abline(a=0,b=0)
qqnorm(rstandard(modelAIC),pch=19,main = "Q-Q plot of standardized residuals")
qqline(rstandard(modelAIC))


cooksd = cooks.distance(modelAIC)
par(mfrow = c(1,2))
plot(cooksd,type="p",pch=19,ylab="Cooks Distance",main = "Cooks Distance")

n=dim(model.matrix(baseline))[1]
p=dim(model.matrix(baseline))[2]
plot(abs(dffits(modelAIC)),ylab ="DFFITS",type = "p",pch=19,ylim = c(0,1.05),main = "DFFITS")
abline(h=1,col='red')
dev.off()