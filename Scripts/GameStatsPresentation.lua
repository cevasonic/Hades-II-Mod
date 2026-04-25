function GameStatsScreenOpenPresentation( screen )
	thread( PlayVoiceLines, GlobalVoiceLines.OpenedGameStatsScreenVoiceLines, true )
end

function GameStatsScreenShowCategoryPresentation( screen )
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonMenuToggle" })
end

function GameStatScreenClosePresentation( screen, button )
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	SetAnimation({ DestinationId = screen.Components.BackgroundFront.Id, Name = "GameStatsOut" })
	thread( PlayVoiceLines, GlobalVoiceLines.ClosedRunHistoryScreenVoiceLines, true )
end

function GameStatsSetActiveColumnPresentation( screen )
	local column = screen.Components[screen.SortKeys[GameState.RunHistoryGameStatsSortMode]]
	local indicator = screen.Components.SortModeIndicator
	ModifyTextBox({ Id = column.Id, Color = screen.ActiveColumnColor })
	Move({ Id = indicator.Id, OffsetX = (column.HeaderX or column.X) + indicator.OffsetX, OffsetY = column.Y + indicator.OffsetY})
	SetAlpha({ Id = indicator.Id, Fraction = 1.0, Duration = 0.1 })
end