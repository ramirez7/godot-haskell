{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ARVRAnchor
       (Godot.Core.ARVRAnchor.sig_mesh_updated,
        Godot.Core.ARVRAnchor.get_anchor_id,
        Godot.Core.ARVRAnchor.get_anchor_name,
        Godot.Core.ARVRAnchor.get_is_active,
        Godot.Core.ARVRAnchor.get_mesh, Godot.Core.ARVRAnchor.get_plane,
        Godot.Core.ARVRAnchor.get_size,
        Godot.Core.ARVRAnchor.set_anchor_id)
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

sig_mesh_updated :: Godot.Internal.Dispatch.Signal ARVRAnchor
sig_mesh_updated = Godot.Internal.Dispatch.Signal "mesh_updated"

instance NodeSignal ARVRAnchor "mesh_updated" '[Mesh]

instance NodeProperty ARVRAnchor "anchor_id" Int 'False where
        nodeProperty
          = (get_anchor_id, wrapDroppingSetter set_anchor_id, Nothing)

{-# NOINLINE bindARVRAnchor_get_anchor_id #-}

bindARVRAnchor_get_anchor_id :: MethodBind
bindARVRAnchor_get_anchor_id
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_anchor_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_anchor_id ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> IO Int
get_anchor_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_anchor_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_anchor_id" '[] (IO Int) where
        nodeMethod = Godot.Core.ARVRAnchor.get_anchor_id

{-# NOINLINE bindARVRAnchor_get_anchor_name #-}

bindARVRAnchor_get_anchor_name :: MethodBind
bindARVRAnchor_get_anchor_name
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_anchor_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_anchor_name ::
                  (ARVRAnchor :< cls, Object :< cls) => cls -> IO GodotString
get_anchor_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_anchor_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_anchor_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ARVRAnchor.get_anchor_name

{-# NOINLINE bindARVRAnchor_get_is_active #-}

bindARVRAnchor_get_is_active :: MethodBind
bindARVRAnchor_get_is_active
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_is_active ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> IO Bool
get_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_is_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_is_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.ARVRAnchor.get_is_active

{-# NOINLINE bindARVRAnchor_get_mesh #-}

bindARVRAnchor_get_mesh :: MethodBind
bindARVRAnchor_get_mesh
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh :: (ARVRAnchor :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.ARVRAnchor.get_mesh

{-# NOINLINE bindARVRAnchor_get_plane #-}

bindARVRAnchor_get_plane :: MethodBind
bindARVRAnchor_get_plane
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_plane" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_plane :: (ARVRAnchor :< cls, Object :< cls) => cls -> IO Plane
get_plane cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_plane (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_plane" '[] (IO Plane) where
        nodeMethod = Godot.Core.ARVRAnchor.get_plane

{-# NOINLINE bindARVRAnchor_get_size #-}

bindARVRAnchor_get_size :: MethodBind
bindARVRAnchor_get_size
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size :: (ARVRAnchor :< cls, Object :< cls) => cls -> IO Vector3
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_size" '[] (IO Vector3) where
        nodeMethod = Godot.Core.ARVRAnchor.get_size

{-# NOINLINE bindARVRAnchor_set_anchor_id #-}

bindARVRAnchor_set_anchor_id :: MethodBind
bindARVRAnchor_set_anchor_id
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "set_anchor_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_anchor_id ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> Int -> IO ()
set_anchor_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_set_anchor_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "set_anchor_id" '[Int] (IO ()) where
        nodeMethod = Godot.Core.ARVRAnchor.set_anchor_id