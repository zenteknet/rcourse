rankhospital <- function(state, outcome, num = "best") {

        ## Read outcome data (Notice "Not Available" entries are replaced by NA with na.strings instruction)
                outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")

        ## Test data
         # state = "TX"
         # outcome = "heart failure"
         # num = 4
         # state = "MD"
         # outcome = "pneumonia"

        ## List of states
        statesList = unique(outcomeData[7])

        ## Check that state and outcome are valid
        if (sum(statesList==state) == 1) {
                dataforState = subset(outcomeData,State == state) # pull from data only the outcomes from the state
                } else {
                        stop("invalid state")
                }

        # Determine column number for argument outcome passed to function
        columnNo = if(outcome=="heart attack") 11   else                # set to column 11 if "heart attack"
                columnNo = if(outcome=="heart failure") 17  else        # set to column 17 if "heart failure"
                               columnNo = if (outcome=="pneumonia") 23 else
                                        stop("invalid outcome")

        ## Return hospital name in that state with lowest 30-day death
        ## rate

        dataforState[ , columnNo] = suppressWarnings(as.numeric(dataforState[ , columnNo]))  # Turn column to numeric

        index = order(dataforState[columnNo],dataforState[2], na.last = NA)           # rank column from least to greatest


        ## Define num
        if (num == "best") num = 1 else
                if (num == "worst") num = length(index)  # let dataforState give NA if num too large instead of a stop()
                                                        # num = nrow(dataforState[columnNo]) didn't work, NA's not removed

        dataforState[index, ][num, 2]            # return hospital specified by num, return NA if num is too large automatically


}


