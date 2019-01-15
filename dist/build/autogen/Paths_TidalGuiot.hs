{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_TidalGuiot (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/guiot/.cabal/bin"
libdir     = "/home/guiot/.cabal/lib/x86_64-linux-ghc-8.0.2/TidalGuiot-0.1.0.0-B3BpTxufbTc2CeTxoGfx0N"
dynlibdir  = "/home/guiot/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/guiot/.cabal/share/x86_64-linux-ghc-8.0.2/TidalGuiot-0.1.0.0"
libexecdir = "/home/guiot/.cabal/libexec"
sysconfdir = "/home/guiot/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TidalGuiot_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TidalGuiot_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TidalGuiot_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TidalGuiot_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TidalGuiot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TidalGuiot_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
