module VM (Register, Memory, State, encrypt, chr', ord') where

import Data.Char
import Data.Array.IO

import TWord

-- register is just a word
type Register = TWord

-- Memory is a mutable array
type Memory = IO (IOArray TWord TWord)

-- State is three registers (a, c, and d) and memory
type State = (Register, Register, Register, Memory)

-- TWord version of ord
ord' :: Char -> TWord
ord' = toEnum . ord

-- TWord version of chr
chr' :: TWord -> Char
chr' = chr . fromEnum

-- Encryption lookup table
encryptTable :: [TWord]
encryptTable = [57,109,60,46,84,86,97,99,96,117,89,42,77,75,39,88,126,120,68,108,125,82,69,111,107,78,58,35,63,71,34,105,64,53,122,93,38,103,113,116,121,102,114,36,40,119,101,52,123,87,80,41,72,45,90,110,44,91,37,92,51,100,76,43,81,59,62,85,33,112,74,83,55,50,70,104,79,65,49,67,66,54,118,94,61,73,95,48,47,56,124,106,115,98]

-- Encryption
encrypt :: TWord -> TWord
encrypt x = encryptTable !! (fromEnum x)
