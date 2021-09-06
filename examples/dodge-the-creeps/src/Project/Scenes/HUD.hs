-- | This file is AUTOGENERATED by godot-haskell-project-generator. DO NOT EDIT

{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables, DerivingStrategies,
  GeneralizedNewtypeDeriving, LambdaCase #-}

module Project.Scenes.HUD where
import Project.Support
import Godot
import GHC.TypeLits

import Godot.Core.CanvasLayer()
import Godot.Core.Label()
import Godot.Core.Timer()
import Godot.Core.Button()

instance SceneResourcePath "HUD" where
  sceneResourcePath = "res://HUD.tscn"


instance SceneRoot "HUD" where
  type SceneRootNode "HUD" = "HUD"


instance SceneNode        "HUD" "HUD" where
  type SceneNodeType      "HUD" "HUD" = CanvasLayer
  type SceneNodeName      "HUD" "HUD" = "HUD"
  type SceneNodeIsHaskell "HUD" "HUD" = 'Just '("HUD", "HUD")


instance SceneNode        "HUD" "MessageLabel" where
  type SceneNodeType      "HUD" "MessageLabel" = Label
  type SceneNodeName      "HUD" "MessageLabel" = "MessageLabel"
  type SceneNodeIsHaskell "HUD" "MessageLabel" = 'Nothing


instance SceneNode        "HUD" "MessageTimer" where
  type SceneNodeType      "HUD" "MessageTimer" = Timer
  type SceneNodeName      "HUD" "MessageTimer" = "MessageTimer"
  type SceneNodeIsHaskell "HUD" "MessageTimer" = 'Nothing


instance SceneNode        "HUD" "ScoreLabel" where
  type SceneNodeType      "HUD" "ScoreLabel" = Label
  type SceneNodeName      "HUD" "ScoreLabel" = "ScoreLabel"
  type SceneNodeIsHaskell "HUD" "ScoreLabel" = 'Nothing


instance SceneNode        "HUD" "StartButton" where
  type SceneNodeType      "HUD" "StartButton" = Button
  type SceneNodeName      "HUD" "StartButton" = "StartButton"
  type SceneNodeIsHaskell "HUD" "StartButton" = 'Nothing


instance SceneConnection "HUD" "MessageTimer" "timeout" "HUD" "_on_MessageTimer_timeout"


instance SceneConnection "HUD" "StartButton" "pressed" "HUD" "_on_StartButton_pressed"
