{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RemoteTransform
       (Godot.Core.RemoteTransform.force_update_cache,
        Godot.Core.RemoteTransform.get_remote_node,
        Godot.Core.RemoteTransform.get_update_position,
        Godot.Core.RemoteTransform.get_update_rotation,
        Godot.Core.RemoteTransform.get_update_scale,
        Godot.Core.RemoteTransform.get_use_global_coordinates,
        Godot.Core.RemoteTransform.set_remote_node,
        Godot.Core.RemoteTransform.set_update_position,
        Godot.Core.RemoteTransform.set_update_rotation,
        Godot.Core.RemoteTransform.set_update_scale,
        Godot.Core.RemoteTransform.set_use_global_coordinates)
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
import Godot.Core.Spatial()

instance NodeProperty RemoteTransform "remote_path" NodePath 'False
         where
        nodeProperty
          = (get_remote_node, wrapDroppingSetter set_remote_node, Nothing)

instance NodeProperty RemoteTransform "update_position" Bool 'False
         where
        nodeProperty
          = (get_update_position, wrapDroppingSetter set_update_position,
             Nothing)

instance NodeProperty RemoteTransform "update_rotation" Bool 'False
         where
        nodeProperty
          = (get_update_rotation, wrapDroppingSetter set_update_rotation,
             Nothing)

instance NodeProperty RemoteTransform "update_scale" Bool 'False
         where
        nodeProperty
          = (get_update_scale, wrapDroppingSetter set_update_scale, Nothing)

instance NodeProperty RemoteTransform "use_global_coordinates" Bool
           'False
         where
        nodeProperty
          = (get_use_global_coordinates,
             wrapDroppingSetter set_use_global_coordinates, Nothing)

{-# NOINLINE bindRemoteTransform_force_update_cache #-}

bindRemoteTransform_force_update_cache :: MethodBind
bindRemoteTransform_force_update_cache
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "force_update_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

force_update_cache ::
                     (RemoteTransform :< cls, Object :< cls) => cls -> IO ()
force_update_cache cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_force_update_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "force_update_cache" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform.force_update_cache

{-# NOINLINE bindRemoteTransform_get_remote_node #-}

bindRemoteTransform_get_remote_node :: MethodBind
bindRemoteTransform_get_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_remote_node ::
                  (RemoteTransform :< cls, Object :< cls) => cls -> IO NodePath
get_remote_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_remote_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "get_remote_node" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.RemoteTransform.get_remote_node

{-# NOINLINE bindRemoteTransform_get_update_position #-}

bindRemoteTransform_get_update_position :: MethodBind
bindRemoteTransform_get_update_position
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_update_position ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_update_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "get_update_position" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform.get_update_position

{-# NOINLINE bindRemoteTransform_get_update_rotation #-}

bindRemoteTransform_get_update_rotation :: MethodBind
bindRemoteTransform_get_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_update_rotation ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_update_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_update_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "get_update_rotation" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform.get_update_rotation

{-# NOINLINE bindRemoteTransform_get_update_scale #-}

bindRemoteTransform_get_update_scale :: MethodBind
bindRemoteTransform_get_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_update_scale ::
                   (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_update_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_update_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "get_update_scale" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform.get_update_scale

{-# NOINLINE bindRemoteTransform_get_use_global_coordinates #-}

bindRemoteTransform_get_use_global_coordinates :: MethodBind
bindRemoteTransform_get_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_use_global_coordinates ::
                             (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_use_global_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRemoteTransform_get_use_global_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "get_use_global_coordinates"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform.get_use_global_coordinates

{-# NOINLINE bindRemoteTransform_set_remote_node #-}

bindRemoteTransform_set_remote_node :: MethodBind
bindRemoteTransform_set_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_remote_node ::
                  (RemoteTransform :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_remote_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_remote_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "set_remote_node" '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform.set_remote_node

{-# NOINLINE bindRemoteTransform_set_update_position #-}

bindRemoteTransform_set_update_position :: MethodBind
bindRemoteTransform_set_update_position
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_update_position ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "set_update_position" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform.set_update_position

{-# NOINLINE bindRemoteTransform_set_update_rotation #-}

bindRemoteTransform_set_update_rotation :: MethodBind
bindRemoteTransform_set_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_update_rotation ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_update_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "set_update_rotation" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform.set_update_rotation

{-# NOINLINE bindRemoteTransform_set_update_scale #-}

bindRemoteTransform_set_update_scale :: MethodBind
bindRemoteTransform_set_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_update_scale ::
                   (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_update_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "set_update_scale" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform.set_update_scale

{-# NOINLINE bindRemoteTransform_set_use_global_coordinates #-}

bindRemoteTransform_set_use_global_coordinates :: MethodBind
bindRemoteTransform_set_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_global_coordinates ::
                             (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_global_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRemoteTransform_set_use_global_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RemoteTransform "set_use_global_coordinates"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform.set_use_global_coordinates