{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Spatial
       (Godot.Core.Spatial._NOTIFICATION_ENTER_WORLD,
        Godot.Core.Spatial._NOTIFICATION_EXIT_WORLD,
        Godot.Core.Spatial._NOTIFICATION_TRANSFORM_CHANGED,
        Godot.Core.Spatial._NOTIFICATION_VISIBILITY_CHANGED,
        Godot.Core.Spatial.sig_visibility_changed,
        Godot.Core.Spatial._update_gizmo,
        Godot.Core.Spatial.force_update_transform,
        Godot.Core.Spatial.get_gizmo,
        Godot.Core.Spatial.get_global_transform,
        Godot.Core.Spatial.get_parent_spatial,
        Godot.Core.Spatial.get_rotation,
        Godot.Core.Spatial.get_rotation_degrees,
        Godot.Core.Spatial.get_scale, Godot.Core.Spatial.get_transform,
        Godot.Core.Spatial.get_translation, Godot.Core.Spatial.get_world,
        Godot.Core.Spatial.global_rotate, Godot.Core.Spatial.global_scale,
        Godot.Core.Spatial.global_translate, Godot.Core.Spatial.hide,
        Godot.Core.Spatial.is_local_transform_notification_enabled,
        Godot.Core.Spatial.is_scale_disabled,
        Godot.Core.Spatial.is_set_as_toplevel,
        Godot.Core.Spatial.is_transform_notification_enabled,
        Godot.Core.Spatial.is_visible,
        Godot.Core.Spatial.is_visible_in_tree, Godot.Core.Spatial.look_at,
        Godot.Core.Spatial.look_at_from_position,
        Godot.Core.Spatial.orthonormalize, Godot.Core.Spatial.rotate,
        Godot.Core.Spatial.rotate_object_local,
        Godot.Core.Spatial.rotate_x, Godot.Core.Spatial.rotate_y,
        Godot.Core.Spatial.rotate_z, Godot.Core.Spatial.scale_object_local,
        Godot.Core.Spatial.set_as_toplevel,
        Godot.Core.Spatial.set_disable_scale, Godot.Core.Spatial.set_gizmo,
        Godot.Core.Spatial.set_global_transform,
        Godot.Core.Spatial.set_identity,
        Godot.Core.Spatial.set_ignore_transform_notification,
        Godot.Core.Spatial.set_notify_local_transform,
        Godot.Core.Spatial.set_notify_transform,
        Godot.Core.Spatial.set_rotation,
        Godot.Core.Spatial.set_rotation_degrees,
        Godot.Core.Spatial.set_scale, Godot.Core.Spatial.set_transform,
        Godot.Core.Spatial.set_translation, Godot.Core.Spatial.set_visible,
        Godot.Core.Spatial.show, Godot.Core.Spatial.to_global,
        Godot.Core.Spatial.to_local, Godot.Core.Spatial.translate,
        Godot.Core.Spatial.translate_object_local,
        Godot.Core.Spatial.update_gizmo)
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
import Godot.Core.Node()

_NOTIFICATION_ENTER_WORLD :: Int
_NOTIFICATION_ENTER_WORLD = 41

_NOTIFICATION_EXIT_WORLD :: Int
_NOTIFICATION_EXIT_WORLD = 42

_NOTIFICATION_TRANSFORM_CHANGED :: Int
_NOTIFICATION_TRANSFORM_CHANGED = 2000

_NOTIFICATION_VISIBILITY_CHANGED :: Int
_NOTIFICATION_VISIBILITY_CHANGED = 43

sig_visibility_changed :: Godot.Internal.Dispatch.Signal Spatial
sig_visibility_changed
  = Godot.Internal.Dispatch.Signal "visibility_changed"

instance NodeSignal Spatial "visibility_changed" '[]

instance NodeProperty Spatial "gizmo" SpatialGizmo 'False where
        nodeProperty = (get_gizmo, wrapDroppingSetter set_gizmo, Nothing)

instance NodeProperty Spatial "global_transform" Transform 'False
         where
        nodeProperty
          = (get_global_transform, wrapDroppingSetter set_global_transform,
             Nothing)

instance NodeProperty Spatial "rotation" Vector3 'False where
        nodeProperty
          = (get_rotation, wrapDroppingSetter set_rotation, Nothing)

instance NodeProperty Spatial "rotation_degrees" Vector3 'False
         where
        nodeProperty
          = (get_rotation_degrees, wrapDroppingSetter set_rotation_degrees,
             Nothing)

instance NodeProperty Spatial "scale" Vector3 'False where
        nodeProperty = (get_scale, wrapDroppingSetter set_scale, Nothing)

instance NodeProperty Spatial "transform" Transform 'False where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

instance NodeProperty Spatial "translation" Vector3 'False where
        nodeProperty
          = (get_translation, wrapDroppingSetter set_translation, Nothing)

instance NodeProperty Spatial "visible" Bool 'False where
        nodeProperty
          = (is_visible, wrapDroppingSetter set_visible, Nothing)

{-# NOINLINE bindSpatial__update_gizmo #-}

bindSpatial__update_gizmo :: MethodBind
bindSpatial__update_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "_update_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_gizmo :: (Spatial :< cls, Object :< cls) => cls -> IO ()
_update_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial__update_gizmo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "_update_gizmo" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial._update_gizmo

{-# NOINLINE bindSpatial_force_update_transform #-}

bindSpatial_force_update_transform :: MethodBind
bindSpatial_force_update_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "force_update_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

force_update_transform ::
                         (Spatial :< cls, Object :< cls) => cls -> IO ()
force_update_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_force_update_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "force_update_transform" '[] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.force_update_transform

{-# NOINLINE bindSpatial_get_gizmo #-}

bindSpatial_get_gizmo :: MethodBind
bindSpatial_get_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_gizmo ::
            (Spatial :< cls, Object :< cls) => cls -> IO SpatialGizmo
get_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_gizmo" '[] (IO SpatialGizmo) where
        nodeMethod = Godot.Core.Spatial.get_gizmo

{-# NOINLINE bindSpatial_get_global_transform #-}

bindSpatial_get_global_transform :: MethodBind
bindSpatial_get_global_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_global_transform ::
                       (Spatial :< cls, Object :< cls) => cls -> IO Transform
get_global_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_global_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_global_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.Spatial.get_global_transform

{-# NOINLINE bindSpatial_get_parent_spatial #-}

bindSpatial_get_parent_spatial :: MethodBind
bindSpatial_get_parent_spatial
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_parent_spatial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_parent_spatial ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Spatial
get_parent_spatial cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_parent_spatial (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_parent_spatial" '[] (IO Spatial)
         where
        nodeMethod = Godot.Core.Spatial.get_parent_spatial

{-# NOINLINE bindSpatial_get_rotation #-}

bindSpatial_get_rotation :: MethodBind
bindSpatial_get_rotation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rotation ::
               (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_rotation" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Spatial.get_rotation

{-# NOINLINE bindSpatial_get_rotation_degrees #-}

bindSpatial_get_rotation_degrees :: MethodBind
bindSpatial_get_rotation_degrees
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rotation_degrees ::
                       (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_rotation_degrees" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.get_rotation_degrees

{-# NOINLINE bindSpatial_get_scale #-}

bindSpatial_get_scale :: MethodBind
bindSpatial_get_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_scale :: (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_scale" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Spatial.get_scale

{-# NOINLINE bindSpatial_get_transform #-}

bindSpatial_get_transform :: MethodBind
bindSpatial_get_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transform ::
                (Spatial :< cls, Object :< cls) => cls -> IO Transform
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_transform" '[] (IO Transform)
         where
        nodeMethod = Godot.Core.Spatial.get_transform

{-# NOINLINE bindSpatial_get_translation #-}

bindSpatial_get_translation :: MethodBind
bindSpatial_get_translation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_translation ::
                  (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_translation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_translation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_translation" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.get_translation

{-# NOINLINE bindSpatial_get_world #-}

bindSpatial_get_world :: MethodBind
bindSpatial_get_world
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_world :: (Spatial :< cls, Object :< cls) => cls -> IO World
get_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_world" '[] (IO World) where
        nodeMethod = Godot.Core.Spatial.get_world

{-# NOINLINE bindSpatial_global_rotate #-}

bindSpatial_global_rotate :: MethodBind
bindSpatial_global_rotate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

global_rotate ::
                (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
global_rotate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_rotate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "global_rotate" '[Vector3, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.global_rotate

{-# NOINLINE bindSpatial_global_scale #-}

bindSpatial_global_scale :: MethodBind
bindSpatial_global_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

global_scale ::
               (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
global_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "global_scale" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.global_scale

{-# NOINLINE bindSpatial_global_translate #-}

bindSpatial_global_translate :: MethodBind
bindSpatial_global_translate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

global_translate ::
                   (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
global_translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_translate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "global_translate" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.global_translate

{-# NOINLINE bindSpatial_hide #-}

bindSpatial_hide :: MethodBind
bindSpatial_hide
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "hide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

hide :: (Spatial :< cls, Object :< cls) => cls -> IO ()
hide cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_hide (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "hide" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.hide

{-# NOINLINE bindSpatial_is_local_transform_notification_enabled
             #-}

bindSpatial_is_local_transform_notification_enabled :: MethodBind
bindSpatial_is_local_transform_notification_enabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_local_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_local_transform_notification_enabled ::
                                          (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_local_transform_notification_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatial_is_local_transform_notification_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial
           "is_local_transform_notification_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.Spatial.is_local_transform_notification_enabled

{-# NOINLINE bindSpatial_is_scale_disabled #-}

bindSpatial_is_scale_disabled :: MethodBind
bindSpatial_is_scale_disabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_scale_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_scale_disabled ::
                    (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_scale_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_scale_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_scale_disabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.Spatial.is_scale_disabled

{-# NOINLINE bindSpatial_is_set_as_toplevel #-}

bindSpatial_is_set_as_toplevel :: MethodBind
bindSpatial_is_set_as_toplevel
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_set_as_toplevel ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_set_as_toplevel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_set_as_toplevel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_set_as_toplevel" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Spatial.is_set_as_toplevel

{-# NOINLINE bindSpatial_is_transform_notification_enabled #-}

bindSpatial_is_transform_notification_enabled :: MethodBind
bindSpatial_is_transform_notification_enabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_transform_notification_enabled ::
                                    (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_transform_notification_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatial_is_transform_notification_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_transform_notification_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Spatial.is_transform_notification_enabled

{-# NOINLINE bindSpatial_is_visible #-}

bindSpatial_is_visible :: MethodBind
bindSpatial_is_visible
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_visible :: (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_visible (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_visible" '[] (IO Bool) where
        nodeMethod = Godot.Core.Spatial.is_visible

{-# NOINLINE bindSpatial_is_visible_in_tree #-}

bindSpatial_is_visible_in_tree :: MethodBind
bindSpatial_is_visible_in_tree
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_visible_in_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_visible_in_tree ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_visible_in_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_visible_in_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_visible_in_tree" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Spatial.is_visible_in_tree

{-# NOINLINE bindSpatial_look_at #-}

bindSpatial_look_at :: MethodBind
bindSpatial_look_at
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "look_at" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

look_at ::
          (Spatial :< cls, Object :< cls) =>
          cls -> Vector3 -> Vector3 -> IO ()
look_at cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_look_at (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "look_at" '[Vector3, Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.look_at

{-# NOINLINE bindSpatial_look_at_from_position #-}

bindSpatial_look_at_from_position :: MethodBind
bindSpatial_look_at_from_position
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "look_at_from_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

look_at_from_position ::
                        (Spatial :< cls, Object :< cls) =>
                        cls -> Vector3 -> Vector3 -> Vector3 -> IO ()
look_at_from_position cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_look_at_from_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "look_at_from_position"
           '[Vector3, Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.look_at_from_position

{-# NOINLINE bindSpatial_orthonormalize #-}

bindSpatial_orthonormalize :: MethodBind
bindSpatial_orthonormalize
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "orthonormalize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

orthonormalize :: (Spatial :< cls, Object :< cls) => cls -> IO ()
orthonormalize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_orthonormalize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "orthonormalize" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.orthonormalize

{-# NOINLINE bindSpatial_rotate #-}

bindSpatial_rotate :: MethodBind
bindSpatial_rotate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rotate ::
         (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
rotate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate" '[Vector3, Float] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.rotate

{-# NOINLINE bindSpatial_rotate_object_local #-}

bindSpatial_rotate_object_local :: MethodBind
bindSpatial_rotate_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rotate_object_local ::
                      (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
rotate_object_local cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_object_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate_object_local" '[Vector3, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.rotate_object_local

{-# NOINLINE bindSpatial_rotate_x #-}

bindSpatial_rotate_x :: MethodBind
bindSpatial_rotate_x
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rotate_x ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_x (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate_x" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Spatial.rotate_x

{-# NOINLINE bindSpatial_rotate_y #-}

bindSpatial_rotate_y :: MethodBind
bindSpatial_rotate_y
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rotate_y ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_y (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate_y" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Spatial.rotate_y

{-# NOINLINE bindSpatial_rotate_z #-}

bindSpatial_rotate_z :: MethodBind
bindSpatial_rotate_z
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rotate_z ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_z (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate_z" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Spatial.rotate_z

{-# NOINLINE bindSpatial_scale_object_local #-}

bindSpatial_scale_object_local :: MethodBind
bindSpatial_scale_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "scale_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

scale_object_local ::
                     (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
scale_object_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_scale_object_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "scale_object_local" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.scale_object_local

{-# NOINLINE bindSpatial_set_as_toplevel #-}

bindSpatial_set_as_toplevel :: MethodBind
bindSpatial_set_as_toplevel
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_as_toplevel ::
                  (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_toplevel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_as_toplevel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_as_toplevel" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_as_toplevel

{-# NOINLINE bindSpatial_set_disable_scale #-}

bindSpatial_set_disable_scale :: MethodBind
bindSpatial_set_disable_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_disable_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_disable_scale ::
                    (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_disable_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_disable_scale" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_disable_scale

{-# NOINLINE bindSpatial_set_gizmo #-}

bindSpatial_set_gizmo :: MethodBind
bindSpatial_set_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_gizmo ::
            (Spatial :< cls, Object :< cls) => cls -> SpatialGizmo -> IO ()
set_gizmo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_gizmo" '[SpatialGizmo] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_gizmo

{-# NOINLINE bindSpatial_set_global_transform #-}

bindSpatial_set_global_transform :: MethodBind
bindSpatial_set_global_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_global_transform ::
                       (Spatial :< cls, Object :< cls) => cls -> Transform -> IO ()
set_global_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_global_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_global_transform" '[Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_global_transform

{-# NOINLINE bindSpatial_set_identity #-}

bindSpatial_set_identity :: MethodBind
bindSpatial_set_identity
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_identity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_identity :: (Spatial :< cls, Object :< cls) => cls -> IO ()
set_identity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_identity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_identity" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_identity

{-# NOINLINE bindSpatial_set_ignore_transform_notification #-}

bindSpatial_set_ignore_transform_notification :: MethodBind
bindSpatial_set_ignore_transform_notification
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_ignore_transform_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_ignore_transform_notification ::
                                    (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ignore_transform_notification cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatial_set_ignore_transform_notification
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_ignore_transform_notification"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_ignore_transform_notification

{-# NOINLINE bindSpatial_set_notify_local_transform #-}

bindSpatial_set_notify_local_transform :: MethodBind
bindSpatial_set_notify_local_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_notify_local_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_notify_local_transform ::
                             (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_notify_local_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_notify_local_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_notify_local_transform" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_notify_local_transform

{-# NOINLINE bindSpatial_set_notify_transform #-}

bindSpatial_set_notify_transform :: MethodBind
bindSpatial_set_notify_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_notify_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_notify_transform ::
                       (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_notify_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_notify_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_notify_transform" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_notify_transform

{-# NOINLINE bindSpatial_set_rotation #-}

bindSpatial_set_rotation :: MethodBind
bindSpatial_set_rotation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rotation ::
               (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_rotation" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_rotation

{-# NOINLINE bindSpatial_set_rotation_degrees #-}

bindSpatial_set_rotation_degrees :: MethodBind
bindSpatial_set_rotation_degrees
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rotation_degrees ::
                       (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_rotation_degrees" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_rotation_degrees

{-# NOINLINE bindSpatial_set_scale #-}

bindSpatial_set_scale :: MethodBind
bindSpatial_set_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_scale ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_scale" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_scale

{-# NOINLINE bindSpatial_set_transform #-}

bindSpatial_set_transform :: MethodBind
bindSpatial_set_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_transform ::
                (Spatial :< cls, Object :< cls) => cls -> Transform -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_transform" '[Transform] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_transform

{-# NOINLINE bindSpatial_set_translation #-}

bindSpatial_set_translation :: MethodBind
bindSpatial_set_translation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_translation ::
                  (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_translation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_translation" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_translation

{-# NOINLINE bindSpatial_set_visible #-}

bindSpatial_set_visible :: MethodBind
bindSpatial_set_visible
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_visible ::
              (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_visible (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_visible" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_visible

{-# NOINLINE bindSpatial_show #-}

bindSpatial_show :: MethodBind
bindSpatial_show
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "show" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

show :: (Spatial :< cls, Object :< cls) => cls -> IO ()
show cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_show (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "show" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.show

{-# NOINLINE bindSpatial_to_global #-}

bindSpatial_to_global :: MethodBind
bindSpatial_to_global
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "to_global" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_global ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
to_global cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_to_global (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "to_global" '[Vector3] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.to_global

{-# NOINLINE bindSpatial_to_local #-}

bindSpatial_to_local :: MethodBind
bindSpatial_to_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "to_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_local ::
           (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
to_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_to_local (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "to_local" '[Vector3] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.to_local

{-# NOINLINE bindSpatial_translate #-}

bindSpatial_translate :: MethodBind
bindSpatial_translate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

translate ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_translate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "translate" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.translate

{-# NOINLINE bindSpatial_translate_object_local #-}

bindSpatial_translate_object_local :: MethodBind
bindSpatial_translate_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "translate_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

translate_object_local ::
                         (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
translate_object_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_translate_object_local
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "translate_object_local" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.translate_object_local

{-# NOINLINE bindSpatial_update_gizmo #-}

bindSpatial_update_gizmo :: MethodBind
bindSpatial_update_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "update_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

update_gizmo :: (Spatial :< cls, Object :< cls) => cls -> IO ()
update_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_update_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "update_gizmo" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.update_gizmo