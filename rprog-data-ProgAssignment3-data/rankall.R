rankall <- function(outcome, num = "best") {

        ## Test data
        # state = "GU"
        #outcome = "heart failure"
        # num = 1
        # state = "GU"
        # outcome = "pneumonia"

        # Source necessary functions
        source('~/GitHub/Rcourse/rprog-data-ProgAssignment3-data/rankhospital.R')

        ## Read outcome data
        outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")

        ## Determine list of states
        statesList = unique(outcomeData[7])  # unique removes duplicate elements in vector
        statesList = statesList$State[order(statesList)]
        # if (state %in% listOfValidStates) { do stuff }

        ## Check that outcome are valid
        allowedOutcomes = c("heart attack", "heart failure", "pneumonia")
        if (!outcome %in% allowedOutcomes) stop("invalid outcome")

        ## For each state, find the hospital of the given rank
        rankedHospitalsList = vector()                           #initialize
        # nonStateList = #     c("GU", "DC", "PR")

        for (state in seq_along(statesList)) {
                # print(statesList[state])                                      # for debugging
                rankedHospitalsList = c(rankedHospitalsList, rankhospital(statesList[state], outcome, num))
                # print(rankhospital(statesList[state], outcome, num))          # for debugging
        }

        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name.
        # Construct data.frame with hospital & state as headers

        hospital = rankedHospitalsList
        state = statesList
        data.frame(hospital, state)

}
