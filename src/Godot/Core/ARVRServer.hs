{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ARVRServer
       (Godot.Core.ARVRServer._RESET_BUT_KEEP_TILT,
        Godot.Core.ARVRServer._RESET_FULL_ROTATION,
        Godot.Core.ARVRServer._TRACKER_CONTROLLER,
        Godot.Core.ARVRServer._TRACKER_UNKNOWN,
        Godot.Core.ARVRServer._TRACKER_ANY_KNOWN,
        Godot.Core.ARVRServer._DONT_RESET_ROTATION,
        Godot.Core.ARVRServer._TRACKER_BASESTATION,
        Godot.Core.ARVRServer._TRACKER_ANCHOR,
        Godot.Core.ARVRServer._TRACKER_ANY,
        Godot.Core.ARVRServer.sig_interface_added,
        Godot.Core.ARVRServer.sig_interface_removed,
        Godot.Core.ARVRServer.sig_tracker_added,
        Godot.Core.ARVRServer.sig_tracker_removed,
        Godot.Core.ARVRServer.center_on_hmd,
        Godot.Core.ARVRServer.find_interface,
        Godot.Core.ARVRServer.get_hmd_transform,
        Godot.Core.ARVRServer.get_interface,
        Godot.Core.ARVRServer.get_interface_count,
        Godot.Core.ARVRServer.get_interfaces,
        Godot.Core.ARVRServer.get_last_commit_usec,
        Godot.Core.ARVRServer.get_last_frame_usec,
        Godot.Core.ARVRServer.get_last_process_usec,
        Godot.Core.ARVRServer.get_primary_interface,
        Godot.Core.ARVRServer.get_reference_frame,
        Godot.Core.ARVRServer.get_tracker,
        Godot.Core.ARVRServer.get_tracker_count,
        Godot.Core.ARVRServer.get_world_scale,
        Godot.Core.ARVRServer.set_primary_interface,
        Godot.Core.ARVRServer.set_world_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Object()

_RESET_BUT_KEEP_TILT :: Int
_RESET_BUT_KEEP_TILT = 1

_RESET_FULL_ROTATION :: Int
_RESET_FULL_ROTATION = 0

_TRACKER_CONTROLLER :: Int
_TRACKER_CONTROLLER = 1

_TRACKER_UNKNOWN :: Int
_TRACKER_UNKNOWN = 128

_TRACKER_ANY_KNOWN :: Int
_TRACKER_ANY_KNOWN = 127

_DONT_RESET_ROTATION :: Int
_DONT_RESET_ROTATION = 2

_TRACKER_BASESTATION :: Int
_TRACKER_BASESTATION = 2

_TRACKER_ANCHOR :: Int
_TRACKER_ANCHOR = 4

_TRACKER_ANY :: Int
_TRACKER_ANY = 255

sig_interface_added :: Godot.Internal.Dispatch.Signal ARVRServer
sig_interface_added
  = Godot.Internal.Dispatch.Signal "interface_added"

instance NodeSignal ARVRServer "interface_added" '[GodotString]

sig_interface_removed :: Godot.Internal.Dispatch.Signal ARVRServer
sig_interface_removed
  = Godot.Internal.Dispatch.Signal "interface_removed"

instance NodeSignal ARVRServer "interface_removed" '[GodotString]

sig_tracker_added :: Godot.Internal.Dispatch.Signal ARVRServer
sig_tracker_added = Godot.Internal.Dispatch.Signal "tracker_added"

instance NodeSignal ARVRServer "tracker_added"
           '[GodotString, Int, Int]

sig_tracker_removed :: Godot.Internal.Dispatch.Signal ARVRServer
sig_tracker_removed
  = Godot.Internal.Dispatch.Signal "tracker_removed"

instance NodeSignal ARVRServer "tracker_removed"
           '[GodotString, Int, Int]

instance NodeProperty ARVRServer "primary_interface" ARVRInterface
           'False
         where
        nodeProperty
          = (get_primary_interface, wrapDroppingSetter set_primary_interface,
             Nothing)

instance NodeProperty ARVRServer "world_scale" Float 'False where
        nodeProperty
          = (get_world_scale, wrapDroppingSetter set_world_scale, Nothing)

{-# NOINLINE bindARVRServer_center_on_hmd #-}

bindARVRServer_center_on_hmd :: MethodBind
bindARVRServer_center_on_hmd
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "center_on_hmd" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

center_on_hmd ::
                (ARVRServer :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
center_on_hmd cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_center_on_hmd (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "center_on_hmd" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.ARVRServer.center_on_hmd

{-# NOINLINE bindARVRServer_find_interface #-}

bindARVRServer_find_interface :: MethodBind
bindARVRServer_find_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "find_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

find_interface ::
                 (ARVRServer :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ARVRInterface
find_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_find_interface (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "find_interface" '[GodotString]
           (IO ARVRInterface)
         where
        nodeMethod = Godot.Core.ARVRServer.find_interface

{-# NOINLINE bindARVRServer_get_hmd_transform #-}

bindARVRServer_get_hmd_transform :: MethodBind
bindARVRServer_get_hmd_transform
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_hmd_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_hmd_transform ::
                    (ARVRServer :< cls, Object :< cls) => cls -> IO Transform
get_hmd_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_hmd_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_hmd_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.ARVRServer.get_hmd_transform

{-# NOINLINE bindARVRServer_get_interface #-}

bindARVRServer_get_interface :: MethodBind
bindARVRServer_get_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_interface ::
                (ARVRServer :< cls, Object :< cls) =>
                cls -> Int -> IO ARVRInterface
get_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_interface (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_interface" '[Int]
           (IO ARVRInterface)
         where
        nodeMethod = Godot.Core.ARVRServer.get_interface

{-# NOINLINE bindARVRServer_get_interface_count #-}

bindARVRServer_get_interface_count :: MethodBind
bindARVRServer_get_interface_count
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_interface_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_interface_count ::
                      (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_interface_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_interface_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_interface_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRServer.get_interface_count

{-# NOINLINE bindARVRServer_get_interfaces #-}

bindARVRServer_get_interfaces :: MethodBind
bindARVRServer_get_interfaces
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_interfaces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_interfaces ::
                 (ARVRServer :< cls, Object :< cls) => cls -> IO Array
get_interfaces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_interfaces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_interfaces" '[] (IO Array)
         where
        nodeMethod = Godot.Core.ARVRServer.get_interfaces

{-# NOINLINE bindARVRServer_get_last_commit_usec #-}

bindARVRServer_get_last_commit_usec :: MethodBind
bindARVRServer_get_last_commit_usec
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_last_commit_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_commit_usec ::
                       (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_last_commit_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_last_commit_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_last_commit_usec" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRServer.get_last_commit_usec

{-# NOINLINE bindARVRServer_get_last_frame_usec #-}

bindARVRServer_get_last_frame_usec :: MethodBind
bindARVRServer_get_last_frame_usec
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_last_frame_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_frame_usec ::
                      (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_last_frame_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_last_frame_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_last_frame_usec" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRServer.get_last_frame_usec

{-# NOINLINE bindARVRServer_get_last_process_usec #-}

bindARVRServer_get_last_process_usec :: MethodBind
bindARVRServer_get_last_process_usec
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_last_process_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_process_usec ::
                        (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_last_process_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_last_process_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_last_process_usec" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRServer.get_last_process_usec

{-# NOINLINE bindARVRServer_get_primary_interface #-}

bindARVRServer_get_primary_interface :: MethodBind
bindARVRServer_get_primary_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_primary_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_primary_interface ::
                        (ARVRServer :< cls, Object :< cls) => cls -> IO ARVRInterface
get_primary_interface cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_primary_interface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_primary_interface" '[]
           (IO ARVRInterface)
         where
        nodeMethod = Godot.Core.ARVRServer.get_primary_interface

{-# NOINLINE bindARVRServer_get_reference_frame #-}

bindARVRServer_get_reference_frame :: MethodBind
bindARVRServer_get_reference_frame
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_reference_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_reference_frame ::
                      (ARVRServer :< cls, Object :< cls) => cls -> IO Transform
get_reference_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_reference_frame
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_reference_frame" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.ARVRServer.get_reference_frame

{-# NOINLINE bindARVRServer_get_tracker #-}

bindARVRServer_get_tracker :: MethodBind
bindARVRServer_get_tracker
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_tracker" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tracker ::
              (ARVRServer :< cls, Object :< cls) =>
              cls -> Int -> IO ARVRPositionalTracker
get_tracker cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_tracker (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_tracker" '[Int]
           (IO ARVRPositionalTracker)
         where
        nodeMethod = Godot.Core.ARVRServer.get_tracker

{-# NOINLINE bindARVRServer_get_tracker_count #-}

bindARVRServer_get_tracker_count :: MethodBind
bindARVRServer_get_tracker_count
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_tracker_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tracker_count ::
                    (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_tracker_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_tracker_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_tracker_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRServer.get_tracker_count

{-# NOINLINE bindARVRServer_get_world_scale #-}

bindARVRServer_get_world_scale :: MethodBind
bindARVRServer_get_world_scale
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_world_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_world_scale ::
                  (ARVRServer :< cls, Object :< cls) => cls -> IO Float
get_world_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_world_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "get_world_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.ARVRServer.get_world_scale

{-# NOINLINE bindARVRServer_set_primary_interface #-}

bindARVRServer_set_primary_interface :: MethodBind
bindARVRServer_set_primary_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "set_primary_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_primary_interface ::
                        (ARVRServer :< cls, Object :< cls) => cls -> ARVRInterface -> IO ()
set_primary_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_set_primary_interface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "set_primary_interface"
           '[ARVRInterface]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRServer.set_primary_interface

{-# NOINLINE bindARVRServer_set_world_scale #-}

bindARVRServer_set_world_scale :: MethodBind
bindARVRServer_set_world_scale
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "set_world_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_world_scale ::
                  (ARVRServer :< cls, Object :< cls) => cls -> Float -> IO ()
set_world_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_set_world_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRServer "set_world_scale" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.ARVRServer.set_world_scale