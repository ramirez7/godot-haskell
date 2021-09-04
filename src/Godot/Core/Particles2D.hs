{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Particles2D
       (Godot.Core.Particles2D._DRAW_ORDER_LIFETIME,
        Godot.Core.Particles2D._DRAW_ORDER_INDEX,
        Godot.Core.Particles2D.capture_rect,
        Godot.Core.Particles2D.get_amount,
        Godot.Core.Particles2D.get_draw_order,
        Godot.Core.Particles2D.get_explosiveness_ratio,
        Godot.Core.Particles2D.get_fixed_fps,
        Godot.Core.Particles2D.get_fractional_delta,
        Godot.Core.Particles2D.get_lifetime,
        Godot.Core.Particles2D.get_normal_map,
        Godot.Core.Particles2D.get_one_shot,
        Godot.Core.Particles2D.get_pre_process_time,
        Godot.Core.Particles2D.get_process_material,
        Godot.Core.Particles2D.get_randomness_ratio,
        Godot.Core.Particles2D.get_speed_scale,
        Godot.Core.Particles2D.get_texture,
        Godot.Core.Particles2D.get_use_local_coordinates,
        Godot.Core.Particles2D.get_visibility_rect,
        Godot.Core.Particles2D.is_emitting, Godot.Core.Particles2D.restart,
        Godot.Core.Particles2D.set_amount,
        Godot.Core.Particles2D.set_draw_order,
        Godot.Core.Particles2D.set_emitting,
        Godot.Core.Particles2D.set_explosiveness_ratio,
        Godot.Core.Particles2D.set_fixed_fps,
        Godot.Core.Particles2D.set_fractional_delta,
        Godot.Core.Particles2D.set_lifetime,
        Godot.Core.Particles2D.set_normal_map,
        Godot.Core.Particles2D.set_one_shot,
        Godot.Core.Particles2D.set_pre_process_time,
        Godot.Core.Particles2D.set_process_material,
        Godot.Core.Particles2D.set_randomness_ratio,
        Godot.Core.Particles2D.set_speed_scale,
        Godot.Core.Particles2D.set_texture,
        Godot.Core.Particles2D.set_use_local_coordinates,
        Godot.Core.Particles2D.set_visibility_rect)
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
import Godot.Core.Node2D()

_DRAW_ORDER_LIFETIME :: Int
_DRAW_ORDER_LIFETIME = 1

_DRAW_ORDER_INDEX :: Int
_DRAW_ORDER_INDEX = 0

instance NodeProperty Particles2D "amount" Int 'False where
        nodeProperty = (get_amount, wrapDroppingSetter set_amount, Nothing)

instance NodeProperty Particles2D "draw_order" Int 'False where
        nodeProperty
          = (get_draw_order, wrapDroppingSetter set_draw_order, Nothing)

instance NodeProperty Particles2D "emitting" Bool 'False where
        nodeProperty
          = (is_emitting, wrapDroppingSetter set_emitting, Nothing)

instance NodeProperty Particles2D "explosiveness" Float 'False
         where
        nodeProperty
          = (get_explosiveness_ratio,
             wrapDroppingSetter set_explosiveness_ratio, Nothing)

instance NodeProperty Particles2D "fixed_fps" Int 'False where
        nodeProperty
          = (get_fixed_fps, wrapDroppingSetter set_fixed_fps, Nothing)

instance NodeProperty Particles2D "fract_delta" Bool 'False where
        nodeProperty
          = (get_fractional_delta, wrapDroppingSetter set_fractional_delta,
             Nothing)

instance NodeProperty Particles2D "lifetime" Float 'False where
        nodeProperty
          = (get_lifetime, wrapDroppingSetter set_lifetime, Nothing)

instance NodeProperty Particles2D "local_coords" Bool 'False where
        nodeProperty
          = (get_use_local_coordinates,
             wrapDroppingSetter set_use_local_coordinates, Nothing)

instance NodeProperty Particles2D "normal_map" Texture 'False where
        nodeProperty
          = (get_normal_map, wrapDroppingSetter set_normal_map, Nothing)

instance NodeProperty Particles2D "one_shot" Bool 'False where
        nodeProperty
          = (get_one_shot, wrapDroppingSetter set_one_shot, Nothing)

instance NodeProperty Particles2D "preprocess" Float 'False where
        nodeProperty
          = (get_pre_process_time, wrapDroppingSetter set_pre_process_time,
             Nothing)

instance NodeProperty Particles2D "process_material" Material
           'False
         where
        nodeProperty
          = (get_process_material, wrapDroppingSetter set_process_material,
             Nothing)

instance NodeProperty Particles2D "randomness" Float 'False where
        nodeProperty
          = (get_randomness_ratio, wrapDroppingSetter set_randomness_ratio,
             Nothing)

instance NodeProperty Particles2D "speed_scale" Float 'False where
        nodeProperty
          = (get_speed_scale, wrapDroppingSetter set_speed_scale, Nothing)

instance NodeProperty Particles2D "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

instance NodeProperty Particles2D "visibility_rect" Rect2 'False
         where
        nodeProperty
          = (get_visibility_rect, wrapDroppingSetter set_visibility_rect,
             Nothing)

{-# NOINLINE bindParticles2D_capture_rect #-}

bindParticles2D_capture_rect :: MethodBind
bindParticles2D_capture_rect
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "capture_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

capture_rect ::
               (Particles2D :< cls, Object :< cls) => cls -> IO Rect2
capture_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_capture_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "capture_rect" '[] (IO Rect2) where
        nodeMethod = Godot.Core.Particles2D.capture_rect

{-# NOINLINE bindParticles2D_get_amount #-}

bindParticles2D_get_amount :: MethodBind
bindParticles2D_get_amount
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_amount :: (Particles2D :< cls, Object :< cls) => cls -> IO Int
get_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_amount" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles2D.get_amount

{-# NOINLINE bindParticles2D_get_draw_order #-}

bindParticles2D_get_draw_order :: MethodBind
bindParticles2D_get_draw_order
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_draw_order ::
                 (Particles2D :< cls, Object :< cls) => cls -> IO Int
get_draw_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_draw_order" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles2D.get_draw_order

{-# NOINLINE bindParticles2D_get_explosiveness_ratio #-}

bindParticles2D_get_explosiveness_ratio :: MethodBind
bindParticles2D_get_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_explosiveness_ratio ::
                          (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_explosiveness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_explosiveness_ratio" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Particles2D.get_explosiveness_ratio

{-# NOINLINE bindParticles2D_get_fixed_fps #-}

bindParticles2D_get_fixed_fps :: MethodBind
bindParticles2D_get_fixed_fps
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fixed_fps ::
                (Particles2D :< cls, Object :< cls) => cls -> IO Int
get_fixed_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_fixed_fps" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles2D.get_fixed_fps

{-# NOINLINE bindParticles2D_get_fractional_delta #-}

bindParticles2D_get_fractional_delta :: MethodBind
bindParticles2D_get_fractional_delta
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fractional_delta ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Bool
get_fractional_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_fractional_delta" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Particles2D.get_fractional_delta

{-# NOINLINE bindParticles2D_get_lifetime #-}

bindParticles2D_get_lifetime :: MethodBind
bindParticles2D_get_lifetime
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_lifetime ::
               (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_lifetime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_lifetime" '[] (IO Float) where
        nodeMethod = Godot.Core.Particles2D.get_lifetime

{-# NOINLINE bindParticles2D_get_normal_map #-}

bindParticles2D_get_normal_map :: MethodBind
bindParticles2D_get_normal_map
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_normal_map ::
                 (Particles2D :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_normal_map" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.Particles2D.get_normal_map

{-# NOINLINE bindParticles2D_get_one_shot #-}

bindParticles2D_get_one_shot :: MethodBind
bindParticles2D_get_one_shot
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_one_shot ::
               (Particles2D :< cls, Object :< cls) => cls -> IO Bool
get_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_one_shot" '[] (IO Bool) where
        nodeMethod = Godot.Core.Particles2D.get_one_shot

{-# NOINLINE bindParticles2D_get_pre_process_time #-}

bindParticles2D_get_pre_process_time :: MethodBind
bindParticles2D_get_pre_process_time
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pre_process_time ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_pre_process_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_pre_process_time" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Particles2D.get_pre_process_time

{-# NOINLINE bindParticles2D_get_process_material #-}

bindParticles2D_get_process_material :: MethodBind
bindParticles2D_get_process_material
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_process_material ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Material
get_process_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_process_material" '[]
           (IO Material)
         where
        nodeMethod = Godot.Core.Particles2D.get_process_material

{-# NOINLINE bindParticles2D_get_randomness_ratio #-}

bindParticles2D_get_randomness_ratio :: MethodBind
bindParticles2D_get_randomness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_randomness_ratio ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_randomness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_randomness_ratio" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Particles2D.get_randomness_ratio

{-# NOINLINE bindParticles2D_get_speed_scale #-}

bindParticles2D_get_speed_scale :: MethodBind
bindParticles2D_get_speed_scale
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_speed_scale ::
                  (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_speed_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Particles2D.get_speed_scale

{-# NOINLINE bindParticles2D_get_texture #-}

bindParticles2D_get_texture :: MethodBind
bindParticles2D_get_texture
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture ::
              (Particles2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_texture" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.Particles2D.get_texture

{-# NOINLINE bindParticles2D_get_use_local_coordinates #-}

bindParticles2D_get_use_local_coordinates :: MethodBind
bindParticles2D_get_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_use_local_coordinates ::
                            (Particles2D :< cls, Object :< cls) => cls -> IO Bool
get_use_local_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_use_local_coordinates" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Particles2D.get_use_local_coordinates

{-# NOINLINE bindParticles2D_get_visibility_rect #-}

bindParticles2D_get_visibility_rect :: MethodBind
bindParticles2D_get_visibility_rect
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_visibility_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_visibility_rect ::
                      (Particles2D :< cls, Object :< cls) => cls -> IO Rect2
get_visibility_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_visibility_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "get_visibility_rect" '[]
           (IO Rect2)
         where
        nodeMethod = Godot.Core.Particles2D.get_visibility_rect

{-# NOINLINE bindParticles2D_is_emitting #-}

bindParticles2D_is_emitting :: MethodBind
bindParticles2D_is_emitting
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "is_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_emitting ::
              (Particles2D :< cls, Object :< cls) => cls -> IO Bool
is_emitting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_is_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "is_emitting" '[] (IO Bool) where
        nodeMethod = Godot.Core.Particles2D.is_emitting

{-# NOINLINE bindParticles2D_restart #-}

bindParticles2D_restart :: MethodBind
bindParticles2D_restart
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

restart :: (Particles2D :< cls, Object :< cls) => cls -> IO ()
restart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_restart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "restart" '[] (IO ()) where
        nodeMethod = Godot.Core.Particles2D.restart

{-# NOINLINE bindParticles2D_set_amount #-}

bindParticles2D_set_amount :: MethodBind
bindParticles2D_set_amount
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_amount ::
             (Particles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_amount" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Particles2D.set_amount

{-# NOINLINE bindParticles2D_set_draw_order #-}

bindParticles2D_set_draw_order :: MethodBind
bindParticles2D_set_draw_order
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_draw_order ::
                 (Particles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_draw_order" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_draw_order

{-# NOINLINE bindParticles2D_set_emitting #-}

bindParticles2D_set_emitting :: MethodBind
bindParticles2D_set_emitting
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_emitting ::
               (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_emitting" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_emitting

{-# NOINLINE bindParticles2D_set_explosiveness_ratio #-}

bindParticles2D_set_explosiveness_ratio :: MethodBind
bindParticles2D_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_explosiveness_ratio ::
                          (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_explosiveness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_explosiveness_ratio" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_explosiveness_ratio

{-# NOINLINE bindParticles2D_set_fixed_fps #-}

bindParticles2D_set_fixed_fps :: MethodBind
bindParticles2D_set_fixed_fps
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fixed_fps ::
                (Particles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_fixed_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_fixed_fps" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_fixed_fps

{-# NOINLINE bindParticles2D_set_fractional_delta #-}

bindParticles2D_set_fractional_delta :: MethodBind
bindParticles2D_set_fractional_delta
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fractional_delta ::
                       (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fractional_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_fractional_delta" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_fractional_delta

{-# NOINLINE bindParticles2D_set_lifetime #-}

bindParticles2D_set_lifetime :: MethodBind
bindParticles2D_set_lifetime
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_lifetime ::
               (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_lifetime" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_lifetime

{-# NOINLINE bindParticles2D_set_normal_map #-}

bindParticles2D_set_normal_map :: MethodBind
bindParticles2D_set_normal_map
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_normal_map ::
                 (Particles2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_normal_map" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_normal_map

{-# NOINLINE bindParticles2D_set_one_shot #-}

bindParticles2D_set_one_shot :: MethodBind
bindParticles2D_set_one_shot
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_one_shot ::
               (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_one_shot" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_one_shot

{-# NOINLINE bindParticles2D_set_pre_process_time #-}

bindParticles2D_set_pre_process_time :: MethodBind
bindParticles2D_set_pre_process_time
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_pre_process_time ::
                       (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_pre_process_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_pre_process_time" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_pre_process_time

{-# NOINLINE bindParticles2D_set_process_material #-}

bindParticles2D_set_process_material :: MethodBind
bindParticles2D_set_process_material
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_process_material ::
                       (Particles2D :< cls, Object :< cls) => cls -> Material -> IO ()
set_process_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_process_material" '[Material]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_process_material

{-# NOINLINE bindParticles2D_set_randomness_ratio #-}

bindParticles2D_set_randomness_ratio :: MethodBind
bindParticles2D_set_randomness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_randomness_ratio ::
                       (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_randomness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_randomness_ratio" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_randomness_ratio

{-# NOINLINE bindParticles2D_set_speed_scale #-}

bindParticles2D_set_speed_scale :: MethodBind
bindParticles2D_set_speed_scale
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_speed_scale ::
                  (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_speed_scale" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_speed_scale

{-# NOINLINE bindParticles2D_set_texture #-}

bindParticles2D_set_texture :: MethodBind
bindParticles2D_set_texture
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture ::
              (Particles2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_texture" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_texture

{-# NOINLINE bindParticles2D_set_use_local_coordinates #-}

bindParticles2D_set_use_local_coordinates :: MethodBind
bindParticles2D_set_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_local_coordinates ::
                            (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_local_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_use_local_coordinates" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_use_local_coordinates

{-# NOINLINE bindParticles2D_set_visibility_rect #-}

bindParticles2D_set_visibility_rect :: MethodBind
bindParticles2D_set_visibility_rect
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_visibility_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_visibility_rect ::
                      (Particles2D :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_visibility_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_visibility_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles2D "set_visibility_rect" '[Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles2D.set_visibility_rect