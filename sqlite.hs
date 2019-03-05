import System.IO
import System.Exit
import Control.Monad
import Text.Printf
import Data.List

data MetaCommandResult =
  MetaCommandExit |
  MetaCommandSuccess |
  MetaCommandUnrecognizedCommand String

data PrepareResult =
  PrepareSuccess |
  PrepareUnrecognizedCommand

data StatementType =
  StatementInsert |
  StatementSelect |
  StatementUnrecognized

basicPrompt :: String
basicPrompt = "db > "

unknownCommandNotification :: String -> String
unknownCommandNotification s = printf "Unrecognized command '%s'" s

prepareMetaCommand :: String -> MetaCommandResult
prepareMetaCommand ".exit" = MetaCommandExit
prepareMetaCommand s = MetaCommandUnrecognizedCommand s

executeMetaCommand :: MetaCommandResult -> IO String
executeMetaCommand MetaCommandExit = exitWith(ExitSuccess)
executeMetaCommand (MetaCommandUnrecognizedCommand s) = do
  return $ unknownCommandNotification s

isMetaCommand :: String -> Bool
isMetaCommand (x:xs) = x == '.'

prepareStatement :: String -> StatementType
prepareStatement input
  | isPrefixOf "insert" input = StatementInsert
  | isPrefixOf "select" input = StatementSelect
  | otherwise = StatementUnrecognized

--return IO String for now.  this will eventually have side effects
executeStatement :: StatementType -> IO String
executeStatement StatementSelect = do
  return "This is where we would do an select"
executeStatement StatementInsert = do
  return "This is where we would do an insert"
executeStatement StatementUnrecognized = do
  return "Unrecognized Statement"

processInput :: String -> IO String
processInput input
  | isMetaCommand input = executeMetaCommand $ prepareMetaCommand input
  | otherwise = executeStatement $ prepareStatement input

main :: IO ()
main = do
  putStr $ basicPrompt
  hFlush stdout
  input <- getLine
  result <- processInput input
  putStrLn result
  main

