{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_nth_prime (
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
version = Version [2,1,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nferreira/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/33e6daaca0d9ffbfdfb1901dc2cbd4b3b5c62250e6db239f9aedb95d3a40e314/8.8.3/bin"
libdir     = "/Users/nferreira/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/33e6daaca0d9ffbfdfb1901dc2cbd4b3b5c62250e6db239f9aedb95d3a40e314/8.8.3/lib/x86_64-osx-ghc-8.8.3/nth-prime-2.1.0.6-CjdSak4kBz07AcomngJeoX-test"
dynlibdir  = "/Users/nferreira/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/33e6daaca0d9ffbfdfb1901dc2cbd4b3b5c62250e6db239f9aedb95d3a40e314/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/nferreira/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/33e6daaca0d9ffbfdfb1901dc2cbd4b3b5c62250e6db239f9aedb95d3a40e314/8.8.3/share/x86_64-osx-ghc-8.8.3/nth-prime-2.1.0.6"
libexecdir = "/Users/nferreira/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/33e6daaca0d9ffbfdfb1901dc2cbd4b3b5c62250e6db239f9aedb95d3a40e314/8.8.3/libexec/x86_64-osx-ghc-8.8.3/nth-prime-2.1.0.6"
sysconfdir = "/Users/nferreira/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/33e6daaca0d9ffbfdfb1901dc2cbd4b3b5c62250e6db239f9aedb95d3a40e314/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "nth_prime_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nth_prime_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "nth_prime_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "nth_prime_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nth_prime_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "nth_prime_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)