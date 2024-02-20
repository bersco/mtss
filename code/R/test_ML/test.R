# Create test set on the classified papers --------------------------------
dat <- read.csv("https://raw.githubusercontent.com/rashida048/Datasets/master/dat.csv", sep = ',', header = T)

dat1 <- fread("./output/round2_3_coded_rescored.csv")

dat <- dat1[,-c("file_in", "title", "journal", "data_bool")]

dat[is.na(dat)] <- 0

intrain <- createDataPartition(y = dat$stat_bool, p= 0.7, list = FALSE)
training <- dat[intrain,]
testing <- dat[-intrain,]

dim(training); 
dim(testing);

anyNA(dat)

training[["stat_bool"]] = factor(training[["stat_bool"]])
# training <- training[,-1]

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

svm_Linear <- train(stat_bool ~., data = training, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)

svm_Linear

test_pred <- predict(svm_Linear, newdata = testing)
test_pred

confusionMatrix(table(test_pred, testing$stat_bool))

grid <- expand.grid(C = c(0,0.01, 0.05, 0.1, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2,5))
svm_Linear_Grid <- train(stat_bool ~., data = training, method = "svmLinear",
                         trControl=trctrl,
                         preProcess = c("center", "scale"),
                         tuneGrid = grid,
                         tuneLength = 10)
svm_Linear_Grid
plot(svm_Linear_Grid)


test_pred_grid <- predict(svm_Linear_Grid, newdata = testing)
test_pred_grid
confusionMatrix(table(test_pred_grid, testing$stat_bool))


full_data <- fread("./output/data_stat_scores_for_all_papers_20210901_2122.csv")
