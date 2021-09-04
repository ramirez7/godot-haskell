{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorSpatialGizmo
       (Godot.Tools.EditorSpatialGizmo.add_collision_segments,
        Godot.Tools.EditorSpatialGizmo.add_collision_triangles,
        Godot.Tools.EditorSpatialGizmo.add_handles,
        Godot.Tools.EditorSpatialGizmo.add_lines,
        Godot.Tools.EditorSpatialGizmo.add_mesh,
        Godot.Tools.EditorSpatialGizmo.add_unscaled_billboard,
        Godot.Tools.EditorSpatialGizmo.clear,
        Godot.Tools.EditorSpatialGizmo.commit_handle,
        Godot.Tools.EditorSpatialGizmo.get_handle_name,
        Godot.Tools.EditorSpatialGizmo.get_handle_value,
        Godot.Tools.EditorSpatialGizmo.get_plugin,
        Godot.Tools.EditorSpatialGizmo.get_spatial_node,
        Godot.Tools.EditorSpatialGizmo.is_handle_highlighted,
        Godot.Tools.EditorSpatialGizmo.redraw,
        Godot.Tools.EditorSpatialGizmo.set_handle,
        Godot.Tools.EditorSpatialGizmo.set_hidden,
        Godot.Tools.EditorSpatialGizmo.set_spatial_node)
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
import Godot.Core.SpatialGizmo()

{-# NOINLINE bindEditorSpatialGizmo_add_collision_segments #-}

bindEditorSpatialGizmo_add_collision_segments :: MethodBind
bindEditorSpatialGizmo_add_collision_segments
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_collision_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_collision_segments ::
                         (EditorSpatialGizmo :< cls, Object :< cls) =>
                         cls -> PoolVector3Array -> IO ()
add_collision_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmo_add_collision_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "add_collision_segments"
           '[PoolVector3Array]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.add_collision_segments

{-# NOINLINE bindEditorSpatialGizmo_add_collision_triangles #-}

bindEditorSpatialGizmo_add_collision_triangles :: MethodBind
bindEditorSpatialGizmo_add_collision_triangles
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_collision_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_collision_triangles ::
                          (EditorSpatialGizmo :< cls, Object :< cls) =>
                          cls -> TriangleMesh -> IO ()
add_collision_triangles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmo_add_collision_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "add_collision_triangles"
           '[TriangleMesh]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.add_collision_triangles

{-# NOINLINE bindEditorSpatialGizmo_add_handles #-}

bindEditorSpatialGizmo_add_handles :: MethodBind
bindEditorSpatialGizmo_add_handles
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_handles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_handles ::
              (EditorSpatialGizmo :< cls, Object :< cls) =>
              cls ->
                PoolVector3Array -> Material -> Maybe Bool -> Maybe Bool -> IO ()
add_handles cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_add_handles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "add_handles"
           '[PoolVector3Array, Material, Maybe Bool, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.add_handles

{-# NOINLINE bindEditorSpatialGizmo_add_lines #-}

bindEditorSpatialGizmo_add_lines :: MethodBind
bindEditorSpatialGizmo_add_lines
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_lines ::
            (EditorSpatialGizmo :< cls, Object :< cls) =>
            cls ->
              PoolVector3Array -> Material -> Maybe Bool -> Maybe Color -> IO ()
add_lines cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_add_lines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "add_lines"
           '[PoolVector3Array, Material, Maybe Bool, Maybe Color]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.add_lines

{-# NOINLINE bindEditorSpatialGizmo_add_mesh #-}

bindEditorSpatialGizmo_add_mesh :: MethodBind
bindEditorSpatialGizmo_add_mesh
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_mesh ::
           (EditorSpatialGizmo :< cls, Object :< cls) =>
           cls ->
             ArrayMesh ->
               Maybe Bool -> Maybe SkinReference -> Maybe Material -> IO ()
add_mesh cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2,
       maybe VariantNil toVariant arg3, maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_add_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "add_mesh"
           '[ArrayMesh, Maybe Bool, Maybe SkinReference, Maybe Material]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.add_mesh

{-# NOINLINE bindEditorSpatialGizmo_add_unscaled_billboard #-}

bindEditorSpatialGizmo_add_unscaled_billboard :: MethodBind
bindEditorSpatialGizmo_add_unscaled_billboard
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_unscaled_billboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_unscaled_billboard ::
                         (EditorSpatialGizmo :< cls, Object :< cls) =>
                         cls -> Material -> Maybe Float -> Maybe Color -> IO ()
add_unscaled_billboard cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantReal (1)) toVariant arg2,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmo_add_unscaled_billboard
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "add_unscaled_billboard"
           '[Material, Maybe Float, Maybe Color]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.add_unscaled_billboard

{-# NOINLINE bindEditorSpatialGizmo_clear #-}

bindEditorSpatialGizmo_clear :: MethodBind
bindEditorSpatialGizmo_clear
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (EditorSpatialGizmo :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "clear" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.clear

{-# NOINLINE bindEditorSpatialGizmo_commit_handle #-}

bindEditorSpatialGizmo_commit_handle :: MethodBind
bindEditorSpatialGizmo_commit_handle
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "commit_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

commit_handle ::
                (EditorSpatialGizmo :< cls, Object :< cls) =>
                cls -> Int -> GodotVariant -> Bool -> IO ()
commit_handle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_commit_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "commit_handle"
           '[Int, GodotVariant, Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.commit_handle

{-# NOINLINE bindEditorSpatialGizmo_get_handle_name #-}

bindEditorSpatialGizmo_get_handle_name :: MethodBind
bindEditorSpatialGizmo_get_handle_name
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_handle_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_handle_name ::
                  (EditorSpatialGizmo :< cls, Object :< cls) =>
                  cls -> Int -> IO GodotString
get_handle_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_handle_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "get_handle_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.get_handle_name

{-# NOINLINE bindEditorSpatialGizmo_get_handle_value #-}

bindEditorSpatialGizmo_get_handle_value :: MethodBind
bindEditorSpatialGizmo_get_handle_value
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_handle_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_handle_value ::
                   (EditorSpatialGizmo :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotVariant
get_handle_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_handle_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "get_handle_value" '[Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.get_handle_value

{-# NOINLINE bindEditorSpatialGizmo_get_plugin #-}

bindEditorSpatialGizmo_get_plugin :: MethodBind
bindEditorSpatialGizmo_get_plugin
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_plugin ::
             (EditorSpatialGizmo :< cls, Object :< cls) =>
             cls -> IO EditorSpatialGizmoPlugin
get_plugin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "get_plugin" '[]
           (IO EditorSpatialGizmoPlugin)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.get_plugin

{-# NOINLINE bindEditorSpatialGizmo_get_spatial_node #-}

bindEditorSpatialGizmo_get_spatial_node :: MethodBind
bindEditorSpatialGizmo_get_spatial_node
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_spatial_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_spatial_node ::
                   (EditorSpatialGizmo :< cls, Object :< cls) => cls -> IO Spatial
get_spatial_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_spatial_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "get_spatial_node" '[]
           (IO Spatial)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.get_spatial_node

{-# NOINLINE bindEditorSpatialGizmo_is_handle_highlighted #-}

bindEditorSpatialGizmo_is_handle_highlighted :: MethodBind
bindEditorSpatialGizmo_is_handle_highlighted
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "is_handle_highlighted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_handle_highlighted ::
                        (EditorSpatialGizmo :< cls, Object :< cls) => cls -> Int -> IO Bool
is_handle_highlighted cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_is_handle_highlighted
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "is_handle_highlighted"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.is_handle_highlighted

{-# NOINLINE bindEditorSpatialGizmo_redraw #-}

bindEditorSpatialGizmo_redraw :: MethodBind
bindEditorSpatialGizmo_redraw
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "redraw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

redraw ::
         (EditorSpatialGizmo :< cls, Object :< cls) => cls -> IO ()
redraw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_redraw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "redraw" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.redraw

{-# NOINLINE bindEditorSpatialGizmo_set_handle #-}

bindEditorSpatialGizmo_set_handle :: MethodBind
bindEditorSpatialGizmo_set_handle
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "set_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_handle ::
             (EditorSpatialGizmo :< cls, Object :< cls) =>
             cls -> Int -> Camera -> Vector2 -> IO ()
set_handle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_set_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "set_handle"
           '[Int, Camera, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.set_handle

{-# NOINLINE bindEditorSpatialGizmo_set_hidden #-}

bindEditorSpatialGizmo_set_hidden :: MethodBind
bindEditorSpatialGizmo_set_hidden
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "set_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_hidden ::
             (EditorSpatialGizmo :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hidden cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_set_hidden
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "set_hidden" '[Bool] (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.set_hidden

{-# NOINLINE bindEditorSpatialGizmo_set_spatial_node #-}

bindEditorSpatialGizmo_set_spatial_node :: MethodBind
bindEditorSpatialGizmo_set_spatial_node
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "set_spatial_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_spatial_node ::
                   (EditorSpatialGizmo :< cls, Object :< cls) => cls -> Node -> IO ()
set_spatial_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_set_spatial_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpatialGizmo "set_spatial_node" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpatialGizmo.set_spatial_node