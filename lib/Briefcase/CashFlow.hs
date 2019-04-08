{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Briefcase.CashFlow where

import Data.Hourglass (Date(..), Period(..), dateAddPeriod)

quarterly :: Date -> [Date]
quarterly = increment (Period 0 3 0)

monthly :: Date -> [Date]
monthly = increment (Period 0 1 0)

fortnightly :: Date -> [Date]
fortnightly = increment (Period 0 0 14)

{-|
Return an infinite lists of dates incrementing by the period specified,
starting from (and including) the given seed date.
-}
increment :: Period -> Date -> [Date]
increment delta from =
  let
    next = dateAddPeriod from delta
  in
    from : increment delta next
