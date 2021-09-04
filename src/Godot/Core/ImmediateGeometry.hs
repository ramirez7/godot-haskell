{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ImmediateGeometry
       (Godot.Core.ImmediateGeometry.add_sphere,
        Godot.Core.ImmediateGeometry.add_vertex,
        Godot.Core.ImmediateGeometry.begin,
        Godot.Core.ImmediateGeometry.clear,
        Godot.Core.ImmediateGeometry.end,
        Godot.Core.ImmediateGeometry.set_color,
        Godot.Core.ImmediateGeometry.set_normal,
        Godot.Core.ImmediateGeometry.set_tangent,
        Godot.Core.ImmediateGeometry.set_uv,
        Godot.Core.ImmediateGeometry.set_uv2)
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
import Godot.Core.GeometryInstance()

{-# NOINLINE bindImmediateGeometry_add_sphere #-}

bindImmediateGeometry_add_sphere :: MethodBind
bindImmediateGeometry_add_sphere
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "add_sphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_sphere ::
             (ImmediateGeometry :< cls, Object :< cls) =>
             cls -> Int -> Int -> Float -> Maybe Bool -> IO ()
add_sphere cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool True) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_add_sphere
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "add_sphere"
           '[Int, Int, Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.add_sphere

{-# NOINLINE bindImmediateGeometry_add_vertex #-}

bindImmediateGeometry_add_vertex :: MethodBind
bindImmediateGeometry_add_vertex
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "add_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_vertex ::
             (ImmediateGeometry :< cls, Object :< cls) =>
             cls -> Vector3 -> IO ()
add_vertex cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_add_vertex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "add_vertex" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.add_vertex

{-# NOINLINE bindImmediateGeometry_begin #-}

bindImmediateGeometry_begin :: MethodBind
bindImmediateGeometry_begin
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

begin ::
        (ImmediateGeometry :< cls, Object :< cls) =>
        cls -> Int -> Maybe Texture -> IO ()
begin cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe VariantNil toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_begin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "begin" '[Int, Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.begin

{-# NOINLINE bindImmediateGeometry_clear #-}

bindImmediateGeometry_clear :: MethodBind
bindImmediateGeometry_clear
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (ImmediateGeometry :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.ImmediateGeometry.clear

{-# NOINLINE bindImmediateGeometry_end #-}

bindImmediateGeometry_end :: MethodBind
bindImmediateGeometry_end
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

end :: (ImmediateGeometry :< cls, Object :< cls) => cls -> IO ()
end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "end" '[] (IO ()) where
        nodeMethod = Godot.Core.ImmediateGeometry.end

{-# NOINLINE bindImmediateGeometry_set_color #-}

bindImmediateGeometry_set_color :: MethodBind
bindImmediateGeometry_set_color
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color ::
            (ImmediateGeometry :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "set_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.set_color

{-# NOINLINE bindImmediateGeometry_set_normal #-}

bindImmediateGeometry_set_normal :: MethodBind
bindImmediateGeometry_set_normal
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_normal ::
             (ImmediateGeometry :< cls, Object :< cls) =>
             cls -> Vector3 -> IO ()
set_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "set_normal" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.set_normal

{-# NOINLINE bindImmediateGeometry_set_tangent #-}

bindImmediateGeometry_set_tangent :: MethodBind
bindImmediateGeometry_set_tangent
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tangent ::
              (ImmediateGeometry :< cls, Object :< cls) => cls -> Plane -> IO ()
set_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "set_tangent" '[Plane]
           (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.set_tangent

{-# NOINLINE bindImmediateGeometry_set_uv #-}

bindImmediateGeometry_set_uv :: MethodBind
bindImmediateGeometry_set_uv
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_uv ::
         (ImmediateGeometry :< cls, Object :< cls) =>
         cls -> Vector2 -> IO ()
set_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_uv (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "set_uv" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.set_uv

{-# NOINLINE bindImmediateGeometry_set_uv2 #-}

bindImmediateGeometry_set_uv2 :: MethodBind
bindImmediateGeometry_set_uv2
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_uv2 ::
          (ImmediateGeometry :< cls, Object :< cls) =>
          cls -> Vector2 -> IO ()
set_uv2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_uv2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImmediateGeometry "set_uv2" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.ImmediateGeometry.set_uv2