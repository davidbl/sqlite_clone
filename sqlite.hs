import System.IO
import Control.Monad
import Text.Printf

basic_prompt :: String
basic_prompt = "db > "

exit_flag :: String
exit_flag = ".exit"
  
unknown_command_notification :: String -> String
unknown_command_notification s = printf "Unrecognized command '%s'" s

main :: IO ()
main = do
  putStr $ basic_prompt
  hFlush stdout
  input <- getLine
  unless (input == exit_flag) $ do
    putStrLn $ unknown_command_notification input
    main
