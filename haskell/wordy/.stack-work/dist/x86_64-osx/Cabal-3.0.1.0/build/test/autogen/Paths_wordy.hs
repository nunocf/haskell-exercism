{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_wordy (
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
version = Version [1,5,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nferreira/Exercism/haskell/wordy/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/bin"
libdir     = "/Users/nferreira/Exercism/haskell/wordy/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/lib/x86_64-osx-ghc-8.8.4/wordy-1.5.0.8-GBxg9BH70rLEoWtAne57zK-test"
dynlibdir  = "/Users/nferreira/Exercism/haskell/wordy/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/nferreira/Exercism/haskell/wordy/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/share/x86_64-osx-ghc-8.8.4/wordy-1.5.0.8"
libexecdir = "/Users/nferreira/Exercism/haskell/wordy/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/libexec/x86_64-osx-ghc-8.8.4/wordy-1.5.0.8"
sysconfdir = "/Users/nferreira/Exercism/haskell/wordy/.stack-work/install/x86_64-osx/3c59bddee8ab2fb944875266e622af10c85f78fbbd107b64480afc01606a752b/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "wordy_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wordy_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "wordy_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "wordy_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wordy_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "wordy_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)