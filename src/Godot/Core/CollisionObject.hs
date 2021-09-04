{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionObject
       (Godot.Core.CollisionObject.sig_input_event,
        Godot.Core.CollisionObject.sig_mouse_entered,
        Godot.Core.CollisionObject.sig_mouse_exited,
        Godot.Core.CollisionObject._input_event,
        Godot.Core.CollisionObject.create_shape_owner,
        Godot.Core.CollisionObject.get_capture_input_on_drag,
        Godot.Core.CollisionObject.get_rid,
        Godot.Core.CollisionObject.get_shape_owners,
        Godot.Core.CollisionObject.is_ray_pickable,
        Godot.Core.CollisionObject.is_shape_owner_disabled,
        Godot.Core.CollisionObject.remove_shape_owner,
        Godot.Core.CollisionObject.set_capture_input_on_drag,
        Godot.Core.CollisionObject.set_ray_pickable,
        Godot.Core.CollisionObject.shape_find_owner,
        Godot.Core.CollisionObject.shape_owner_add_shape,
        Godot.Core.CollisionObject.shape_owner_clear_shapes,
        Godot.Core.CollisionObject.shape_owner_get_owner,
        Godot.Core.CollisionObject.shape_owner_get_shape,
        Godot.Core.CollisionObject.shape_owner_get_shape_count,
        Godot.Core.CollisionObject.shape_owner_get_shape_index,
        Godot.Core.CollisionObject.shape_owner_get_transform,
        Godot.Core.CollisionObject.shape_owner_remove_shape,
        Godot.Core.CollisionObject.shape_owner_set_disabled,
        Godot.Core.CollisionObject.shape_owner_set_transform)
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

sig_input_event :: Godot.Internal.Dispatch.Signal CollisionObject
sig_input_event = Godot.Internal.Dispatch.Signal "input_event"

instance NodeSignal CollisionObject "input_event"
           '[Node, InputEvent, Vector3, Vector3, Int]

sig_mouse_entered :: Godot.Internal.Dispatch.Signal CollisionObject
sig_mouse_entered = Godot.Internal.Dispatch.Signal "mouse_entered"

instance NodeSignal CollisionObject "mouse_entered" '[]

sig_mouse_exited :: Godot.Internal.Dispatch.Signal CollisionObject
sig_mouse_exited = Godot.Internal.Dispatch.Signal "mouse_exited"

instance NodeSignal CollisionObject "mouse_exited" '[]

instance NodeProperty CollisionObject "input_capture_on_drag" Bool
           'False
         where
        nodeProperty
          = (get_capture_input_on_drag,
             wrapDroppingSetter set_capture_input_on_drag, Nothing)

instance NodeProperty CollisionObject "input_ray_pickable" Bool
           'False
         where
        nodeProperty
          = (is_ray_pickable, wrapDroppingSetter set_ray_pickable, Nothing)

{-# NOINLINE bindCollisionObject__input_event #-}

bindCollisionObject__input_event :: MethodBind
bindCollisionObject__input_event
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_input_event ::
               (CollisionObject :< cls, Object :< cls) =>
               cls -> Object -> InputEvent -> Vector3 -> Vector3 -> Int -> IO ()
_input_event cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject__input_event
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "_input_event"
           '[Object, InputEvent, Vector3, Vector3, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject._input_event

{-# NOINLINE bindCollisionObject_create_shape_owner #-}

bindCollisionObject_create_shape_owner :: MethodBind
bindCollisionObject_create_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "create_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_shape_owner ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Object -> IO Int
create_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_create_shape_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "create_shape_owner" '[Object]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.create_shape_owner

{-# NOINLINE bindCollisionObject_get_capture_input_on_drag #-}

bindCollisionObject_get_capture_input_on_drag :: MethodBind
bindCollisionObject_get_capture_input_on_drag
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_capture_input_on_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_capture_input_on_drag ::
                            (CollisionObject :< cls, Object :< cls) => cls -> IO Bool
get_capture_input_on_drag cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_get_capture_input_on_drag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "get_capture_input_on_drag" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.get_capture_input_on_drag

{-# NOINLINE bindCollisionObject_get_rid #-}

bindCollisionObject_get_rid :: MethodBind
bindCollisionObject_get_rid
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rid :: (CollisionObject :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.CollisionObject.get_rid

{-# NOINLINE bindCollisionObject_get_shape_owners #-}

bindCollisionObject_get_shape_owners :: MethodBind
bindCollisionObject_get_shape_owners
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_shape_owners" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shape_owners ::
                   (CollisionObject :< cls, Object :< cls) => cls -> IO Array
get_shape_owners cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_shape_owners
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "get_shape_owners" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.CollisionObject.get_shape_owners

{-# NOINLINE bindCollisionObject_is_ray_pickable #-}

bindCollisionObject_is_ray_pickable :: MethodBind
bindCollisionObject_is_ray_pickable
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "is_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_ray_pickable ::
                  (CollisionObject :< cls, Object :< cls) => cls -> IO Bool
is_ray_pickable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_is_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "is_ray_pickable" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.is_ray_pickable

{-# NOINLINE bindCollisionObject_is_shape_owner_disabled #-}

bindCollisionObject_is_shape_owner_disabled :: MethodBind
bindCollisionObject_is_shape_owner_disabled
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "is_shape_owner_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_shape_owner_disabled ::
                          (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Bool
is_shape_owner_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_is_shape_owner_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "is_shape_owner_disabled"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject.is_shape_owner_disabled

{-# NOINLINE bindCollisionObject_remove_shape_owner #-}

bindCollisionObject_remove_shape_owner :: MethodBind
bindCollisionObject_remove_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "remove_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_shape_owner ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
remove_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_remove_shape_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "remove_shape_owner" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.remove_shape_owner

{-# NOINLINE bindCollisionObject_set_capture_input_on_drag #-}

bindCollisionObject_set_capture_input_on_drag :: MethodBind
bindCollisionObject_set_capture_input_on_drag
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_capture_input_on_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_capture_input_on_drag ::
                            (CollisionObject :< cls, Object :< cls) => cls -> Bool -> IO ()
set_capture_input_on_drag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_set_capture_input_on_drag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "set_capture_input_on_drag"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_capture_input_on_drag

{-# NOINLINE bindCollisionObject_set_ray_pickable #-}

bindCollisionObject_set_ray_pickable :: MethodBind
bindCollisionObject_set_ray_pickable
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_ray_pickable ::
                   (CollisionObject :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ray_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "set_ray_pickable" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.set_ray_pickable

{-# NOINLINE bindCollisionObject_shape_find_owner #-}

bindCollisionObject_shape_find_owner :: MethodBind
bindCollisionObject_shape_find_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_find_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_find_owner ::
                   (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Int
shape_find_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_find_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_find_owner" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_find_owner

{-# NOINLINE bindCollisionObject_shape_owner_add_shape #-}

bindCollisionObject_shape_owner_add_shape :: MethodBind
bindCollisionObject_shape_owner_add_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_add_shape ::
                        (CollisionObject :< cls, Object :< cls) =>
                        cls -> Int -> Shape -> IO ()
shape_owner_add_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_add_shape"
           '[Int, Shape]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_add_shape

{-# NOINLINE bindCollisionObject_shape_owner_clear_shapes #-}

bindCollisionObject_shape_owner_clear_shapes :: MethodBind
bindCollisionObject_shape_owner_clear_shapes
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_clear_shapes ::
                           (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
shape_owner_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_clear_shapes"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_clear_shapes

{-# NOINLINE bindCollisionObject_shape_owner_get_owner #-}

bindCollisionObject_shape_owner_get_owner :: MethodBind
bindCollisionObject_shape_owner_get_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_get_owner ::
                        (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Object
shape_owner_get_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_get_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_get_owner" '[Int]
           (IO Object)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_owner

{-# NOINLINE bindCollisionObject_shape_owner_get_shape #-}

bindCollisionObject_shape_owner_get_shape :: MethodBind
bindCollisionObject_shape_owner_get_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_get_shape ::
                        (CollisionObject :< cls, Object :< cls) =>
                        cls -> Int -> Int -> IO Shape
shape_owner_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_get_shape"
           '[Int, Int]
           (IO Shape)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_shape

{-# NOINLINE bindCollisionObject_shape_owner_get_shape_count #-}

bindCollisionObject_shape_owner_get_shape_count :: MethodBind
bindCollisionObject_shape_owner_get_shape_count
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_get_shape_count ::
                              (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Int
shape_owner_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_get_shape_count"
           '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_shape_count

{-# NOINLINE bindCollisionObject_shape_owner_get_shape_index #-}

bindCollisionObject_shape_owner_get_shape_index :: MethodBind
bindCollisionObject_shape_owner_get_shape_index
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_get_shape_index ::
                              (CollisionObject :< cls, Object :< cls) =>
                              cls -> Int -> Int -> IO Int
shape_owner_get_shape_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_shape_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_get_shape_index"
           '[Int, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_shape_index

{-# NOINLINE bindCollisionObject_shape_owner_get_transform #-}

bindCollisionObject_shape_owner_get_transform :: MethodBind
bindCollisionObject_shape_owner_get_transform
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_get_transform ::
                            (CollisionObject :< cls, Object :< cls) =>
                            cls -> Int -> IO Transform
shape_owner_get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_get_transform"
           '[Int]
           (IO Transform)
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_get_transform

{-# NOINLINE bindCollisionObject_shape_owner_remove_shape #-}

bindCollisionObject_shape_owner_remove_shape :: MethodBind
bindCollisionObject_shape_owner_remove_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_remove_shape ::
                           (CollisionObject :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO ()
shape_owner_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_remove_shape"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_remove_shape

{-# NOINLINE bindCollisionObject_shape_owner_set_disabled #-}

bindCollisionObject_shape_owner_set_disabled :: MethodBind
bindCollisionObject_shape_owner_set_disabled
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_set_disabled ::
                           (CollisionObject :< cls, Object :< cls) =>
                           cls -> Int -> Bool -> IO ()
shape_owner_set_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_set_disabled"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_set_disabled

{-# NOINLINE bindCollisionObject_shape_owner_set_transform #-}

bindCollisionObject_shape_owner_set_transform :: MethodBind
bindCollisionObject_shape_owner_set_transform
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shape_owner_set_transform ::
                            (CollisionObject :< cls, Object :< cls) =>
                            cls -> Int -> Transform -> IO ()
shape_owner_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject "shape_owner_set_transform"
           '[Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject.shape_owner_set_transform