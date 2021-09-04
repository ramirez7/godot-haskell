{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Camera
       (Godot.Core.Camera._PROJECTION_FRUSTUM,
        Godot.Core.Camera._PROJECTION_ORTHOGONAL,
        Godot.Core.Camera._KEEP_HEIGHT,
        Godot.Core.Camera._DOPPLER_TRACKING_PHYSICS_STEP,
        Godot.Core.Camera._DOPPLER_TRACKING_DISABLED,
        Godot.Core.Camera._KEEP_WIDTH,
        Godot.Core.Camera._DOPPLER_TRACKING_IDLE_STEP,
        Godot.Core.Camera._PROJECTION_PERSPECTIVE,
        Godot.Core.Camera.clear_current, Godot.Core.Camera.get_camera_rid,
        Godot.Core.Camera.get_camera_transform,
        Godot.Core.Camera.get_cull_mask,
        Godot.Core.Camera.get_cull_mask_bit,
        Godot.Core.Camera.get_doppler_tracking,
        Godot.Core.Camera.get_environment, Godot.Core.Camera.get_fov,
        Godot.Core.Camera.get_frustum,
        Godot.Core.Camera.get_frustum_offset,
        Godot.Core.Camera.get_h_offset,
        Godot.Core.Camera.get_keep_aspect_mode,
        Godot.Core.Camera.get_projection, Godot.Core.Camera.get_size,
        Godot.Core.Camera.get_v_offset, Godot.Core.Camera.get_zfar,
        Godot.Core.Camera.get_znear, Godot.Core.Camera.is_current,
        Godot.Core.Camera.is_position_behind,
        Godot.Core.Camera.make_current,
        Godot.Core.Camera.project_local_ray_normal,
        Godot.Core.Camera.project_position,
        Godot.Core.Camera.project_ray_normal,
        Godot.Core.Camera.project_ray_origin,
        Godot.Core.Camera.set_cull_mask,
        Godot.Core.Camera.set_cull_mask_bit, Godot.Core.Camera.set_current,
        Godot.Core.Camera.set_doppler_tracking,
        Godot.Core.Camera.set_environment, Godot.Core.Camera.set_fov,
        Godot.Core.Camera.set_frustum,
        Godot.Core.Camera.set_frustum_offset,
        Godot.Core.Camera.set_h_offset,
        Godot.Core.Camera.set_keep_aspect_mode,
        Godot.Core.Camera.set_orthogonal,
        Godot.Core.Camera.set_perspective,
        Godot.Core.Camera.set_projection, Godot.Core.Camera.set_size,
        Godot.Core.Camera.set_v_offset, Godot.Core.Camera.set_zfar,
        Godot.Core.Camera.set_znear, Godot.Core.Camera.unproject_position)
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

_PROJECTION_FRUSTUM :: Int
_PROJECTION_FRUSTUM = 2

_PROJECTION_ORTHOGONAL :: Int
_PROJECTION_ORTHOGONAL = 1

_KEEP_HEIGHT :: Int
_KEEP_HEIGHT = 1

_DOPPLER_TRACKING_PHYSICS_STEP :: Int
_DOPPLER_TRACKING_PHYSICS_STEP = 2

_DOPPLER_TRACKING_DISABLED :: Int
_DOPPLER_TRACKING_DISABLED = 0

_KEEP_WIDTH :: Int
_KEEP_WIDTH = 0

_DOPPLER_TRACKING_IDLE_STEP :: Int
_DOPPLER_TRACKING_IDLE_STEP = 1

_PROJECTION_PERSPECTIVE :: Int
_PROJECTION_PERSPECTIVE = 0

instance NodeProperty Camera "cull_mask" Int 'False where
        nodeProperty
          = (get_cull_mask, wrapDroppingSetter set_cull_mask, Nothing)

instance NodeProperty Camera "current" Bool 'False where
        nodeProperty
          = (is_current, wrapDroppingSetter set_current, Nothing)

instance NodeProperty Camera "doppler_tracking" Int 'False where
        nodeProperty
          = (get_doppler_tracking, wrapDroppingSetter set_doppler_tracking,
             Nothing)

instance NodeProperty Camera "environment" Environment 'False where
        nodeProperty
          = (get_environment, wrapDroppingSetter set_environment, Nothing)

instance NodeProperty Camera "far" Float 'False where
        nodeProperty = (get_zfar, wrapDroppingSetter set_zfar, Nothing)

instance NodeProperty Camera "fov" Float 'False where
        nodeProperty = (get_fov, wrapDroppingSetter set_fov, Nothing)

instance NodeProperty Camera "frustum_offset" Vector2 'False where
        nodeProperty
          = (get_frustum_offset, wrapDroppingSetter set_frustum_offset,
             Nothing)

instance NodeProperty Camera "h_offset" Float 'False where
        nodeProperty
          = (get_h_offset, wrapDroppingSetter set_h_offset, Nothing)

instance NodeProperty Camera "keep_aspect" Int 'False where
        nodeProperty
          = (get_keep_aspect_mode, wrapDroppingSetter set_keep_aspect_mode,
             Nothing)

instance NodeProperty Camera "near" Float 'False where
        nodeProperty = (get_znear, wrapDroppingSetter set_znear, Nothing)

instance NodeProperty Camera "projection" Int 'False where
        nodeProperty
          = (get_projection, wrapDroppingSetter set_projection, Nothing)

instance NodeProperty Camera "size" Float 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

instance NodeProperty Camera "v_offset" Float 'False where
        nodeProperty
          = (get_v_offset, wrapDroppingSetter set_v_offset, Nothing)

{-# NOINLINE bindCamera_clear_current #-}

bindCamera_clear_current :: MethodBind
bindCamera_clear_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_current ::
                (Camera :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
clear_current cls arg1
  = withVariantArray [maybe (VariantBool True) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_clear_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "clear_current" '[Maybe Bool] (IO ())
         where
        nodeMethod = Godot.Core.Camera.clear_current

{-# NOINLINE bindCamera_get_camera_rid #-}

bindCamera_get_camera_rid :: MethodBind
bindCamera_get_camera_rid
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_camera_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_camera_rid :: (Camera :< cls, Object :< cls) => cls -> IO Rid
get_camera_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_camera_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_camera_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Camera.get_camera_rid

{-# NOINLINE bindCamera_get_camera_transform #-}

bindCamera_get_camera_transform :: MethodBind
bindCamera_get_camera_transform
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_camera_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_camera_transform ::
                       (Camera :< cls, Object :< cls) => cls -> IO Transform
get_camera_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_camera_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_camera_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.Camera.get_camera_transform

{-# NOINLINE bindCamera_get_cull_mask #-}

bindCamera_get_cull_mask :: MethodBind
bindCamera_get_cull_mask
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cull_mask :: (Camera :< cls, Object :< cls) => cls -> IO Int
get_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_cull_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.Camera.get_cull_mask

{-# NOINLINE bindCamera_get_cull_mask_bit #-}

bindCamera_get_cull_mask_bit :: MethodBind
bindCamera_get_cull_mask_bit
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_cull_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cull_mask_bit ::
                    (Camera :< cls, Object :< cls) => cls -> Int -> IO Bool
get_cull_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_cull_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_cull_mask_bit" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Camera.get_cull_mask_bit

{-# NOINLINE bindCamera_get_doppler_tracking #-}

bindCamera_get_doppler_tracking :: MethodBind
bindCamera_get_doppler_tracking
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_doppler_tracking ::
                       (Camera :< cls, Object :< cls) => cls -> IO Int
get_doppler_tracking cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_doppler_tracking (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_doppler_tracking" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Camera.get_doppler_tracking

{-# NOINLINE bindCamera_get_environment #-}

bindCamera_get_environment :: MethodBind
bindCamera_get_environment
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_environment ::
                  (Camera :< cls, Object :< cls) => cls -> IO Environment
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_environment" '[] (IO Environment)
         where
        nodeMethod = Godot.Core.Camera.get_environment

{-# NOINLINE bindCamera_get_fov #-}

bindCamera_get_fov :: MethodBind
bindCamera_get_fov
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fov :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_fov cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_fov (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_fov" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_fov

{-# NOINLINE bindCamera_get_frustum #-}

bindCamera_get_frustum :: MethodBind
bindCamera_get_frustum
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_frustum :: (Camera :< cls, Object :< cls) => cls -> IO Array
get_frustum cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_frustum (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_frustum" '[] (IO Array) where
        nodeMethod = Godot.Core.Camera.get_frustum

{-# NOINLINE bindCamera_get_frustum_offset #-}

bindCamera_get_frustum_offset :: MethodBind
bindCamera_get_frustum_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_frustum_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_frustum_offset ::
                     (Camera :< cls, Object :< cls) => cls -> IO Vector2
get_frustum_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_frustum_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_frustum_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Camera.get_frustum_offset

{-# NOINLINE bindCamera_get_h_offset #-}

bindCamera_get_h_offset :: MethodBind
bindCamera_get_h_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_h_offset :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_h_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_h_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_h_offset

{-# NOINLINE bindCamera_get_keep_aspect_mode #-}

bindCamera_get_keep_aspect_mode :: MethodBind
bindCamera_get_keep_aspect_mode
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_keep_aspect_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_keep_aspect_mode ::
                       (Camera :< cls, Object :< cls) => cls -> IO Int
get_keep_aspect_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_keep_aspect_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_keep_aspect_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Camera.get_keep_aspect_mode

{-# NOINLINE bindCamera_get_projection #-}

bindCamera_get_projection :: MethodBind
bindCamera_get_projection
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_projection :: (Camera :< cls, Object :< cls) => cls -> IO Int
get_projection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_projection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_projection" '[] (IO Int) where
        nodeMethod = Godot.Core.Camera.get_projection

{-# NOINLINE bindCamera_get_size #-}

bindCamera_get_size :: MethodBind
bindCamera_get_size
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_size" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_size

{-# NOINLINE bindCamera_get_v_offset #-}

bindCamera_get_v_offset :: MethodBind
bindCamera_get_v_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_v_offset :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_v_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_v_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_v_offset

{-# NOINLINE bindCamera_get_zfar #-}

bindCamera_get_zfar :: MethodBind
bindCamera_get_zfar
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_zfar :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_zfar cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_zfar (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_zfar" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_zfar

{-# NOINLINE bindCamera_get_znear #-}

bindCamera_get_znear :: MethodBind
bindCamera_get_znear
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_znear :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_znear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_znear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_znear" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_znear

{-# NOINLINE bindCamera_is_current #-}

bindCamera_is_current :: MethodBind
bindCamera_is_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_current :: (Camera :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "is_current" '[] (IO Bool) where
        nodeMethod = Godot.Core.Camera.is_current

{-# NOINLINE bindCamera_is_position_behind #-}

bindCamera_is_position_behind :: MethodBind
bindCamera_is_position_behind
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "is_position_behind" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_position_behind ::
                     (Camera :< cls, Object :< cls) => cls -> Vector3 -> IO Bool
is_position_behind cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_is_position_behind (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "is_position_behind" '[Vector3]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera.is_position_behind

{-# NOINLINE bindCamera_make_current #-}

bindCamera_make_current :: MethodBind
bindCamera_make_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_current :: (Camera :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_make_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "make_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera.make_current

{-# NOINLINE bindCamera_project_local_ray_normal #-}

bindCamera_project_local_ray_normal :: MethodBind
bindCamera_project_local_ray_normal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_local_ray_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

project_local_ray_normal ::
                           (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_local_ray_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_local_ray_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_local_ray_normal" '[Vector2]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_local_ray_normal

{-# NOINLINE bindCamera_project_position #-}

bindCamera_project_position :: MethodBind
bindCamera_project_position
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

project_position ::
                   (Camera :< cls, Object :< cls) =>
                   cls -> Vector2 -> Float -> IO Vector3
project_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_position" '[Vector2, Float]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_position

{-# NOINLINE bindCamera_project_ray_normal #-}

bindCamera_project_ray_normal :: MethodBind
bindCamera_project_ray_normal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_ray_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

project_ray_normal ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_ray_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_ray_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_ray_normal" '[Vector2]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_ray_normal

{-# NOINLINE bindCamera_project_ray_origin #-}

bindCamera_project_ray_origin :: MethodBind
bindCamera_project_ray_origin
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_ray_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

project_ray_origin ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_ray_origin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_ray_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_ray_origin" '[Vector2]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_ray_origin

{-# NOINLINE bindCamera_set_cull_mask #-}

bindCamera_set_cull_mask :: MethodBind
bindCamera_set_cull_mask
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cull_mask ::
                (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_cull_mask" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_cull_mask

{-# NOINLINE bindCamera_set_cull_mask_bit #-}

bindCamera_set_cull_mask_bit :: MethodBind
bindCamera_set_cull_mask_bit
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_cull_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cull_mask_bit ::
                    (Camera :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_cull_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_cull_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_cull_mask_bit" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_cull_mask_bit

{-# NOINLINE bindCamera_set_current #-}

bindCamera_set_current :: MethodBind
bindCamera_set_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_current ::
              (Camera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_current" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_current

{-# NOINLINE bindCamera_set_doppler_tracking #-}

bindCamera_set_doppler_tracking :: MethodBind
bindCamera_set_doppler_tracking
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_doppler_tracking ::
                       (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_doppler_tracking cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_doppler_tracking (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_doppler_tracking" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_doppler_tracking

{-# NOINLINE bindCamera_set_environment #-}

bindCamera_set_environment :: MethodBind
bindCamera_set_environment
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_environment ::
                  (Camera :< cls, Object :< cls) => cls -> Environment -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_environment" '[Environment] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_environment

{-# NOINLINE bindCamera_set_fov #-}

bindCamera_set_fov :: MethodBind
bindCamera_set_fov
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fov :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_fov cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_fov (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_fov" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_fov

{-# NOINLINE bindCamera_set_frustum #-}

bindCamera_set_frustum :: MethodBind
bindCamera_set_frustum
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_frustum ::
              (Camera :< cls, Object :< cls) =>
              cls -> Float -> Vector2 -> Float -> Float -> IO ()
set_frustum cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_frustum (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_frustum"
           '[Float, Vector2, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_frustum

{-# NOINLINE bindCamera_set_frustum_offset #-}

bindCamera_set_frustum_offset :: MethodBind
bindCamera_set_frustum_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_frustum_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_frustum_offset ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_frustum_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_frustum_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_frustum_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_frustum_offset

{-# NOINLINE bindCamera_set_h_offset #-}

bindCamera_set_h_offset :: MethodBind
bindCamera_set_h_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_h_offset ::
               (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_h_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_h_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_h_offset

{-# NOINLINE bindCamera_set_keep_aspect_mode #-}

bindCamera_set_keep_aspect_mode :: MethodBind
bindCamera_set_keep_aspect_mode
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_keep_aspect_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_keep_aspect_mode ::
                       (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_keep_aspect_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_keep_aspect_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_keep_aspect_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_keep_aspect_mode

{-# NOINLINE bindCamera_set_orthogonal #-}

bindCamera_set_orthogonal :: MethodBind
bindCamera_set_orthogonal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_orthogonal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_orthogonal ::
                 (Camera :< cls, Object :< cls) =>
                 cls -> Float -> Float -> Float -> IO ()
set_orthogonal cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_orthogonal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_orthogonal" '[Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_orthogonal

{-# NOINLINE bindCamera_set_perspective #-}

bindCamera_set_perspective :: MethodBind
bindCamera_set_perspective
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_perspective ::
                  (Camera :< cls, Object :< cls) =>
                  cls -> Float -> Float -> Float -> IO ()
set_perspective cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_perspective (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_perspective" '[Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_perspective

{-# NOINLINE bindCamera_set_projection #-}

bindCamera_set_projection :: MethodBind
bindCamera_set_projection
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_projection ::
                 (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_projection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_projection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_projection" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_projection

{-# NOINLINE bindCamera_set_size #-}

bindCamera_set_size :: MethodBind
bindCamera_set_size
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_size :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_size" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_size

{-# NOINLINE bindCamera_set_v_offset #-}

bindCamera_set_v_offset :: MethodBind
bindCamera_set_v_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_v_offset ::
               (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_v_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_v_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_v_offset

{-# NOINLINE bindCamera_set_zfar #-}

bindCamera_set_zfar :: MethodBind
bindCamera_set_zfar
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_zfar :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_zfar cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_zfar (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_zfar" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_zfar

{-# NOINLINE bindCamera_set_znear #-}

bindCamera_set_znear :: MethodBind
bindCamera_set_znear
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_znear ::
            (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_znear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_znear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_znear" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_znear

{-# NOINLINE bindCamera_unproject_position #-}

bindCamera_unproject_position :: MethodBind
bindCamera_unproject_position
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "unproject_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

unproject_position ::
                     (Camera :< cls, Object :< cls) => cls -> Vector3 -> IO Vector2
unproject_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_unproject_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "unproject_position" '[Vector3]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Camera.unproject_position