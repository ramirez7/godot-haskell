{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Tween
       (Godot.Core.Tween._TRANS_SINE,
        Godot.Core.Tween._TWEEN_PROCESS_IDLE,
        Godot.Core.Tween._TWEEN_PROCESS_PHYSICS,
        Godot.Core.Tween._TRANS_LINEAR, Godot.Core.Tween._EASE_OUT_IN,
        Godot.Core.Tween._TRANS_QUAD, Godot.Core.Tween._TRANS_EXPO,
        Godot.Core.Tween._EASE_IN, Godot.Core.Tween._TRANS_QUINT,
        Godot.Core.Tween._TRANS_BOUNCE, Godot.Core.Tween._TRANS_ELASTIC,
        Godot.Core.Tween._TRANS_CUBIC, Godot.Core.Tween._EASE_OUT,
        Godot.Core.Tween._EASE_IN_OUT, Godot.Core.Tween._TRANS_QUART,
        Godot.Core.Tween._TRANS_BACK, Godot.Core.Tween._TRANS_CIRC,
        Godot.Core.Tween.sig_tween_all_completed,
        Godot.Core.Tween.sig_tween_completed,
        Godot.Core.Tween.sig_tween_started,
        Godot.Core.Tween.sig_tween_step, Godot.Core.Tween._remove_by_uid,
        Godot.Core.Tween.follow_method, Godot.Core.Tween.follow_property,
        Godot.Core.Tween.get_runtime, Godot.Core.Tween.get_speed_scale,
        Godot.Core.Tween.get_tween_process_mode,
        Godot.Core.Tween.interpolate_callback,
        Godot.Core.Tween.interpolate_deferred_callback,
        Godot.Core.Tween.interpolate_method,
        Godot.Core.Tween.interpolate_property, Godot.Core.Tween.is_active,
        Godot.Core.Tween.is_repeat, Godot.Core.Tween.remove,
        Godot.Core.Tween.remove_all, Godot.Core.Tween.reset,
        Godot.Core.Tween.reset_all, Godot.Core.Tween.resume,
        Godot.Core.Tween.resume_all, Godot.Core.Tween.seek,
        Godot.Core.Tween.set_active, Godot.Core.Tween.set_repeat,
        Godot.Core.Tween.set_speed_scale,
        Godot.Core.Tween.set_tween_process_mode, Godot.Core.Tween.start,
        Godot.Core.Tween.stop, Godot.Core.Tween.stop_all,
        Godot.Core.Tween.targeting_method,
        Godot.Core.Tween.targeting_property, Godot.Core.Tween.tell)
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

_TRANS_SINE :: Int
_TRANS_SINE = 1

_TWEEN_PROCESS_IDLE :: Int
_TWEEN_PROCESS_IDLE = 1

_TWEEN_PROCESS_PHYSICS :: Int
_TWEEN_PROCESS_PHYSICS = 0

_TRANS_LINEAR :: Int
_TRANS_LINEAR = 0

_EASE_OUT_IN :: Int
_EASE_OUT_IN = 3

_TRANS_QUAD :: Int
_TRANS_QUAD = 4

_TRANS_EXPO :: Int
_TRANS_EXPO = 5

_EASE_IN :: Int
_EASE_IN = 0

_TRANS_QUINT :: Int
_TRANS_QUINT = 2

_TRANS_BOUNCE :: Int
_TRANS_BOUNCE = 9

_TRANS_ELASTIC :: Int
_TRANS_ELASTIC = 6

_TRANS_CUBIC :: Int
_TRANS_CUBIC = 7

_EASE_OUT :: Int
_EASE_OUT = 1

_EASE_IN_OUT :: Int
_EASE_IN_OUT = 2

_TRANS_QUART :: Int
_TRANS_QUART = 3

_TRANS_BACK :: Int
_TRANS_BACK = 10

_TRANS_CIRC :: Int
_TRANS_CIRC = 8

sig_tween_all_completed :: Godot.Internal.Dispatch.Signal Tween
sig_tween_all_completed
  = Godot.Internal.Dispatch.Signal "tween_all_completed"

instance NodeSignal Tween "tween_all_completed" '[]

sig_tween_completed :: Godot.Internal.Dispatch.Signal Tween
sig_tween_completed
  = Godot.Internal.Dispatch.Signal "tween_completed"

instance NodeSignal Tween "tween_completed" '[Object, NodePath]

sig_tween_started :: Godot.Internal.Dispatch.Signal Tween
sig_tween_started = Godot.Internal.Dispatch.Signal "tween_started"

instance NodeSignal Tween "tween_started" '[Object, NodePath]

sig_tween_step :: Godot.Internal.Dispatch.Signal Tween
sig_tween_step = Godot.Internal.Dispatch.Signal "tween_step"

instance NodeSignal Tween "tween_step"
           '[Object, NodePath, Float, Object]

instance NodeProperty Tween "playback_process_mode" Int 'False
         where
        nodeProperty
          = (get_tween_process_mode,
             wrapDroppingSetter set_tween_process_mode, Nothing)

instance NodeProperty Tween "playback_speed" Float 'False where
        nodeProperty
          = (get_speed_scale, wrapDroppingSetter set_speed_scale, Nothing)

instance NodeProperty Tween "repeat" Bool 'False where
        nodeProperty = (is_repeat, wrapDroppingSetter set_repeat, Nothing)

{-# NOINLINE bindTween__remove_by_uid #-}

bindTween__remove_by_uid :: MethodBind
bindTween__remove_by_uid
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "_remove_by_uid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_remove_by_uid ::
                 (Tween :< cls, Object :< cls) => cls -> Int -> IO ()
_remove_by_uid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween__remove_by_uid (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "_remove_by_uid" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Tween._remove_by_uid

{-# NOINLINE bindTween_follow_method #-}

bindTween_follow_method :: MethodBind
bindTween_follow_method
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "follow_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

follow_method ::
                (Tween :< cls, Object :< cls) =>
                cls ->
                  Object ->
                    GodotString ->
                      GodotVariant ->
                        Object ->
                          GodotString ->
                            Float -> Maybe Int -> Maybe Int -> Maybe Float -> IO Bool
follow_method cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantInt (0)) toVariant arg7,
       maybe (VariantInt (2)) toVariant arg8,
       maybe (VariantReal (0)) toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_follow_method (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "follow_method"
           '[Object, GodotString, GodotVariant, Object, GodotString, Float,
             Maybe Int, Maybe Int, Maybe Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.follow_method

{-# NOINLINE bindTween_follow_property #-}

bindTween_follow_property :: MethodBind
bindTween_follow_property
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "follow_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

follow_property ::
                  (Tween :< cls, Object :< cls) =>
                  cls ->
                    Object ->
                      NodePath ->
                        GodotVariant ->
                          Object ->
                            NodePath ->
                              Float -> Maybe Int -> Maybe Int -> Maybe Float -> IO Bool
follow_property cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantInt (0)) toVariant arg7,
       maybe (VariantInt (2)) toVariant arg8,
       maybe (VariantReal (0)) toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_follow_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "follow_property"
           '[Object, NodePath, GodotVariant, Object, NodePath, Float,
             Maybe Int, Maybe Int, Maybe Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.follow_property

{-# NOINLINE bindTween_get_runtime #-}

bindTween_get_runtime :: MethodBind
bindTween_get_runtime
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "get_runtime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_runtime :: (Tween :< cls, Object :< cls) => cls -> IO Float
get_runtime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_get_runtime (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "get_runtime" '[] (IO Float) where
        nodeMethod = Godot.Core.Tween.get_runtime

{-# NOINLINE bindTween_get_speed_scale #-}

bindTween_get_speed_scale :: MethodBind
bindTween_get_speed_scale
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_speed_scale :: (Tween :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_get_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "get_speed_scale" '[] (IO Float) where
        nodeMethod = Godot.Core.Tween.get_speed_scale

{-# NOINLINE bindTween_get_tween_process_mode #-}

bindTween_get_tween_process_mode :: MethodBind
bindTween_get_tween_process_mode
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "get_tween_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tween_process_mode ::
                         (Tween :< cls, Object :< cls) => cls -> IO Int
get_tween_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_get_tween_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "get_tween_process_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Tween.get_tween_process_mode

{-# NOINLINE bindTween_interpolate_callback #-}

bindTween_interpolate_callback :: MethodBind
bindTween_interpolate_callback
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

interpolate_callback ::
                       (Tween :< cls, Object :< cls) =>
                       cls ->
                         Object ->
                           Float ->
                             GodotString ->
                               Maybe GodotVariant ->
                                 Maybe GodotVariant ->
                                   Maybe GodotVariant ->
                                     Maybe GodotVariant -> Maybe GodotVariant -> IO Bool
interpolate_callback cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4, maybe VariantNil toVariant arg5,
       maybe VariantNil toVariant arg6, maybe VariantNil toVariant arg7,
       maybe VariantNil toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_callback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "interpolate_callback"
           '[Object, Float, GodotString, Maybe GodotVariant,
             Maybe GodotVariant, Maybe GodotVariant, Maybe GodotVariant,
             Maybe GodotVariant]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.interpolate_callback

{-# NOINLINE bindTween_interpolate_deferred_callback #-}

bindTween_interpolate_deferred_callback :: MethodBind
bindTween_interpolate_deferred_callback
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_deferred_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

interpolate_deferred_callback ::
                                (Tween :< cls, Object :< cls) =>
                                cls ->
                                  Object ->
                                    Float ->
                                      GodotString ->
                                        Maybe GodotVariant ->
                                          Maybe GodotVariant ->
                                            Maybe GodotVariant ->
                                              Maybe GodotVariant -> Maybe GodotVariant -> IO Bool
interpolate_deferred_callback cls arg1 arg2 arg3 arg4 arg5 arg6
  arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4, maybe VariantNil toVariant arg5,
       maybe VariantNil toVariant arg6, maybe VariantNil toVariant arg7,
       maybe VariantNil toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_deferred_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "interpolate_deferred_callback"
           '[Object, Float, GodotString, Maybe GodotVariant,
             Maybe GodotVariant, Maybe GodotVariant, Maybe GodotVariant,
             Maybe GodotVariant]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.interpolate_deferred_callback

{-# NOINLINE bindTween_interpolate_method #-}

bindTween_interpolate_method :: MethodBind
bindTween_interpolate_method
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

interpolate_method ::
                     (Tween :< cls, Object :< cls) =>
                     cls ->
                       Object ->
                         GodotString ->
                           GodotVariant ->
                             GodotVariant ->
                               Float -> Maybe Int -> Maybe Int -> Maybe Float -> IO Bool
interpolate_method cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, maybe (VariantInt (0)) toVariant arg6,
       maybe (VariantInt (2)) toVariant arg7,
       maybe (VariantReal (0)) toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "interpolate_method"
           '[Object, GodotString, GodotVariant, GodotVariant, Float,
             Maybe Int, Maybe Int, Maybe Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.interpolate_method

{-# NOINLINE bindTween_interpolate_property #-}

bindTween_interpolate_property :: MethodBind
bindTween_interpolate_property
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

interpolate_property ::
                       (Tween :< cls, Object :< cls) =>
                       cls ->
                         Object ->
                           NodePath ->
                             GodotVariant ->
                               GodotVariant ->
                                 Float -> Maybe Int -> Maybe Int -> Maybe Float -> IO Bool
interpolate_property cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, maybe (VariantInt (0)) toVariant arg6,
       maybe (VariantInt (2)) toVariant arg7,
       maybe (VariantReal (0)) toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "interpolate_property"
           '[Object, NodePath, GodotVariant, GodotVariant, Float, Maybe Int,
             Maybe Int, Maybe Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.interpolate_property

{-# NOINLINE bindTween_is_active #-}

bindTween_is_active :: MethodBind
bindTween_is_active
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_active :: (Tween :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_is_active (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "is_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.is_active

{-# NOINLINE bindTween_is_repeat #-}

bindTween_is_repeat :: MethodBind
bindTween_is_repeat
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "is_repeat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_repeat :: (Tween :< cls, Object :< cls) => cls -> IO Bool
is_repeat cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_is_repeat (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "is_repeat" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.is_repeat

{-# NOINLINE bindTween_remove #-}

bindTween_remove :: MethodBind
bindTween_remove
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove ::
         (Tween :< cls, Object :< cls) =>
         cls -> Object -> Maybe GodotString -> IO Bool
remove cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_remove (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "remove" '[Object, Maybe GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.remove

{-# NOINLINE bindTween_remove_all #-}

bindTween_remove_all :: MethodBind
bindTween_remove_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "remove_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
remove_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_remove_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "remove_all" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.remove_all

{-# NOINLINE bindTween_reset #-}

bindTween_reset :: MethodBind
bindTween_reset
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "reset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reset ::
        (Tween :< cls, Object :< cls) =>
        cls -> Object -> Maybe GodotString -> IO Bool
reset cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_reset (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "reset" '[Object, Maybe GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.reset

{-# NOINLINE bindTween_reset_all #-}

bindTween_reset_all :: MethodBind
bindTween_reset_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "reset_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reset_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
reset_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_reset_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "reset_all" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.reset_all

{-# NOINLINE bindTween_resume #-}

bindTween_resume :: MethodBind
bindTween_resume
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "resume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resume ::
         (Tween :< cls, Object :< cls) =>
         cls -> Object -> Maybe GodotString -> IO Bool
resume cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_resume (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "resume" '[Object, Maybe GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.resume

{-# NOINLINE bindTween_resume_all #-}

bindTween_resume_all :: MethodBind
bindTween_resume_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "resume_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resume_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
resume_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_resume_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "resume_all" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.resume_all

{-# NOINLINE bindTween_seek #-}

bindTween_seek :: MethodBind
bindTween_seek
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

seek :: (Tween :< cls, Object :< cls) => cls -> Float -> IO Bool
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_seek (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "seek" '[Float] (IO Bool) where
        nodeMethod = Godot.Core.Tween.seek

{-# NOINLINE bindTween_set_active #-}

bindTween_set_active :: MethodBind
bindTween_set_active
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_active :: (Tween :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_active (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "set_active" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Tween.set_active

{-# NOINLINE bindTween_set_repeat #-}

bindTween_set_repeat :: MethodBind
bindTween_set_repeat
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_repeat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_repeat :: (Tween :< cls, Object :< cls) => cls -> Bool -> IO ()
set_repeat cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_repeat (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "set_repeat" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Tween.set_repeat

{-# NOINLINE bindTween_set_speed_scale #-}

-- | Scales the speed of tweening. This affects all @Tweener@s and their delays.
bindTween_set_speed_scale :: MethodBind
bindTween_set_speed_scale
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the speed of tweening. This affects all @Tweener@s and their delays.
set_speed_scale ::
                  (Tween :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "set_speed_scale" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Tween.set_speed_scale

{-# NOINLINE bindTween_set_tween_process_mode #-}

bindTween_set_tween_process_mode :: MethodBind
bindTween_set_tween_process_mode
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_tween_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tween_process_mode ::
                         (Tween :< cls, Object :< cls) => cls -> Int -> IO ()
set_tween_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_tween_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "set_tween_process_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Tween.set_tween_process_mode

{-# NOINLINE bindTween_start #-}

bindTween_start :: MethodBind
bindTween_start
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

start :: (Tween :< cls, Object :< cls) => cls -> IO Bool
start cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_start (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "start" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.start

{-# NOINLINE bindTween_stop #-}

-- | Stops the tweening and resets the @Tween@ to its initial state. This will not remove any appended @Tweener@s.
bindTween_stop :: MethodBind
bindTween_stop
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the tweening and resets the @Tween@ to its initial state. This will not remove any appended @Tweener@s.
stop ::
       (Tween :< cls, Object :< cls) =>
       cls -> Object -> Maybe GodotString -> IO Bool
stop cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_stop (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "stop" '[Object, Maybe GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.stop

{-# NOINLINE bindTween_stop_all #-}

bindTween_stop_all :: MethodBind
bindTween_stop_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "stop_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

stop_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
stop_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_stop_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "stop_all" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tween.stop_all

{-# NOINLINE bindTween_targeting_method #-}

bindTween_targeting_method :: MethodBind
bindTween_targeting_method
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "targeting_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

targeting_method ::
                   (Tween :< cls, Object :< cls) =>
                   cls ->
                     Object ->
                       GodotString ->
                         Object ->
                           GodotString ->
                             GodotVariant ->
                               Float -> Maybe Int -> Maybe Int -> Maybe Float -> IO Bool
targeting_method cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantInt (0)) toVariant arg7,
       maybe (VariantInt (2)) toVariant arg8,
       maybe (VariantReal (0)) toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_targeting_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "targeting_method"
           '[Object, GodotString, Object, GodotString, GodotVariant, Float,
             Maybe Int, Maybe Int, Maybe Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.targeting_method

{-# NOINLINE bindTween_targeting_property #-}

bindTween_targeting_property :: MethodBind
bindTween_targeting_property
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "targeting_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

targeting_property ::
                     (Tween :< cls, Object :< cls) =>
                     cls ->
                       Object ->
                         NodePath ->
                           Object ->
                             NodePath ->
                               GodotVariant ->
                                 Float -> Maybe Int -> Maybe Int -> Maybe Float -> IO Bool
targeting_property cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantInt (0)) toVariant arg7,
       maybe (VariantInt (2)) toVariant arg8,
       maybe (VariantReal (0)) toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_targeting_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "targeting_property"
           '[Object, NodePath, Object, NodePath, GodotVariant, Float,
             Maybe Int, Maybe Int, Maybe Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tween.targeting_property

{-# NOINLINE bindTween_tell #-}

bindTween_tell :: MethodBind
bindTween_tell
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "tell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tell :: (Tween :< cls, Object :< cls) => cls -> IO Float
tell cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_tell (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tween "tell" '[] (IO Float) where
        nodeMethod = Godot.Core.Tween.tell