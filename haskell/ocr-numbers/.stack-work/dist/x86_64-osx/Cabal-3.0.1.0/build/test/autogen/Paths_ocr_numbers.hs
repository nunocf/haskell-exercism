{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ocr_numbers (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nferreira/Exercism/haskell/ocr-numbers/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/bin"
libdir     = "/Users/nferreira/Exercism/haskell/ocr-numbers/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/lib/x86_64-osx-ghc-8.8.4/ocr-numbers-1.2.0.6-L7MExaANlJF7nkehY9ZgBX-test"
dynlibdir  = "/Users/nferreira/Exercism/haskell/ocr-numbers/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/nferreira/Exercism/haskell/ocr-numbers/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/share/x86_64-osx-ghc-8.8.4/ocr-numbers-1.2.0.6"
libexecdir = "/Users/nferreira/Exercism/haskell/ocr-numbers/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/libexec/x86_64-osx-ghc-8.8.4/ocr-numbers-1.2.0.6"
sysconfdir = "/Users/nferreira/Exercism/haskell/ocr-numbers/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ocr_numbers_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ocr_numbers_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ocr_numbers_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ocr_numbers_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ocr_numbers_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ocr_numbers_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
