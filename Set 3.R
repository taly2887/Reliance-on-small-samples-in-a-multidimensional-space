# Set parameters
n<-10000000
kappa=2
E=40
f=20

# Generate data
counter<-c(1:n)
cue1<-sample(0:1,n,replace=T)
cue2<-sample(0:1,n,replace=T)
cue3<-sample(0:1,n,replace=T)
State <- ifelse((cue1 == 1 & cue2 == 1 & cue3 == 1),8,0)
State <- ifelse((cue1 == 1 & cue2 == 1 & cue3 == 0),7,State)
State <- ifelse((cue1 == 1 & cue2 == 0 & cue3 == 1),6,State)
State <- ifelse((cue1 == 1 & cue2 == 0 & cue3 == 0),5,State)
State <- ifelse((cue1 == 0 & cue2 == 1 & cue3 == 1),4,State)
State <- ifelse((cue1 == 0 & cue2 == 1 & cue3 == 0),3,State)
State <- ifelse((cue1 == 0 & cue2 == 0 & cue3 == 1),2,State)
State <- ifelse((cue1 == 0 & cue2 == 0 & cue3 == 0),1,State)
Frequency<-ifelse((cue1 == 1 & cue2 == 1 & cue3 == 1),4,0)
Frequency<-ifelse((cue1 == 1 & cue2 == 1 & cue3 == 0),3,Frequency)
Frequency<-ifelse((cue1 == 1 & cue2 == 0 & cue3 == 1),3,Frequency)
Frequency<-ifelse((cue1 == 0 & cue2 == 1 & cue3 == 1),3,Frequency)
Frequency<-ifelse((cue1 == 0 & cue2 == 0 & cue3 == 1),2,Frequency)
Frequency<-ifelse((cue1 == 1 & cue2 == 0 & cue3 == 0),2,Frequency)
Frequency<-ifelse((cue1 == 0 & cue2 == 1 & cue3 == 0),2,Frequency)
Frequency<-ifelse((cue1 == 0 & cue2 == 0 & cue3 == 0),1,Frequency)

# Crate value libraries for E, F, State
Rare_State_Sample<-c(2,2,2,2,2,2,2,2,2,2)
sample_positive<-sample(c(2,2),  10*3,replace=T)
sample_negative<-sample(c(-2,-2),10*4,replace=T)
sample_all<-c(sample_positive,sample_negative,Rare_State_Sample)

#Randomization for each kappa per trial
Values<-c()
for (trial in 1:n) {
  Value<-c()
  for (k in 1:kappa) {
    random<-runif(1,0,100)
    if (random<=f){                                                 #f
      if      (Frequency[trial]==1){Value[k]<-(-2)}
      else if (Frequency[trial]==2){Value[k]<-(-2)}
      else if (Frequency[trial]==3){Value[k]<-(2)}
      else if (Frequency[trial]==4){Value[k]<-(2)}}
    if ((random<=(f+E))&(random>f)){                                 #E
      Value[k]<-sample(sample_all,1)
    }        
    if (random>(f+E)){
      if      (Frequency[trial]==1){Value[k]<-(-2)}
      else if (Frequency[trial]==2){Value[k]<-(-2)}
      else if (Frequency[trial]==3){Value[k]<-(2)}
      else if (Frequency[trial]==4){Value[k]<-(2)}}
  } #end of kappa
  Values[trial]<-mean(Value)
}

R<-ifelse(Values>0,1,0)
R<-ifelse(Values==0,0.5,R)
a2<-read.csv("Set3.csv",header=T)
State_R<-aggregate(a2$R, by=list(a2$State, a2$Group), FUN=mean, na.rm=TRUE)
dat1<-as.data.frame(cbind(State,R))
Prediction_per_State<-aggregate(dat1$R,list(dat1$State),mean)
Prediction_per_State$Experimental<-State_R$x[1:8]
Prediction_per_State$MSD<-(Prediction_per_State$Experimental-Prediction_per_State$x)^2
plot(Prediction_per_State$Group.1, Prediction_per_State$MSD,ylim=c(0,0.01))
mean(Prediction_per_State$MSD)

write.csv(Prediction_per_State,"Set3 output.csv", row.names = FALSE)
