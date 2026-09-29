best <- function(state, outcome) {

        ## Read outcome data
                outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        ## Test data
                # state = "NY"
                # outcome = "pneumonia"
                # state = "MD"
                # outcome = "pneumonia"

        ## Check that state and outcome are valid


        statesList = unique(outcomeData[7])              # determine the subset of data based on the state
        if (sum(statesList==state) == 1) {
                dataforState = subset(outcomeData,State == state) # pull from data only the outcomes from the state
                } else {
                        stop("invalid state")
                }
        # Determine column number for argument outcome passed to function
        columnNo = if(outcome=="heart attack") 11   else     # set to column 11 if "heart attack"
                columnNo = if(outcome=="heart failure") 17  else     # set to column 17 if "heart failure"
                               columnNo = if (outcome=="pneumonia") 23 else
                                                                             stop("invalid outcome")


        ## Return hospital name in that state with lowest 30-day death
        ## rate

        dataforState[ , columnNo] = suppressWarnings(as.numeric(dataforState[ , columnNo]))  # Turn column to numeric
        index = order(dataforState[columnNo])                                             # rank column from least to greatest
        dataforState[index,][1, 2]                                                        # return hospital in first row

}


