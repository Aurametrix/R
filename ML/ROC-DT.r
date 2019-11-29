outlook = c('rain', 'overcast', 'rain', 'sunny', 'rain', 
            'rain', 'sunny', 'overcast', 'overcast', 'overcast', 
            'sunny', 'sunny', 'rain', 'rain', 'overcast',
            'sunny', 'overcast', 'overcast', 'sunny', 'sunny',
            'sunny', 'overcast')
humidity = c(79, 74, 80, 60, 65, 79, 60, 74, 77, 80, 
             71, 70, 80, 65, 70, 56, 80, 70, 56, 70,
             71, 77)
windy = c(T, T, F, T, F, T, T, T, T, F, T, F, F, F, T, T, F, T, T, F, T, T)
play = c(F, F, T, F, T, F, F, T, T, T, F, F, T, T, T, T, T, T, F, T, F, T)

game = data.frame(outlook, humidity, windy, play)
game$score = NA

attach(game)

game$score[outlook == 'sunny' & humidity <= 70] = 5/8
game$score[outlook == 'sunny' & humidity > 70] = 1 - 3/4
game$score[outlook == 'overcast'] = 4/5
game$score[outlook == 'rain' & windy == T] = 1 - 2/2
game$score[outlook == 'rain' & windy == F] = 3/3
detach(game)

game$predict = game$score >= 0.5
game$correct = game$predict == game$play

library(ROCR)

pred = prediction(game$score, game$play)
roc = performance(pred, measure="tpr", x.measure="fpr")
plot(roc, col="orange", lwd=2) 
lines(x=c(0, 1), y=c(0, 1), col="red", lwd=2)

auc = performance(pred, 'auc')
slot(auc, 'y.values')
