void Main()
{
}

void WriteFile() {
   MwSArray<CGameNetPlayerInfo@> players = GetPlayers();
   auto json = Json::Array();
   for (uint i = 0; i < players.Length; i++) {
      CGamePlayerInfo@ player = cast<CGamePlayerInfo@>(players[i]);
      json.Add(player.Name);
      print(player.Name);
   }
   auto folderLocation = IO::FromDataFolder("GetPlayersInLobby");
   IO::CreateFolder(folderLocation);
   auto filename = Text::Format(folderLocation + "/%d_players.json", Time::Stamp);
   Json::ToFile(filename,json);
   Notify("Exported to " + filename);
}

void RenderMenuMain(){
   RenderMenu();
}
void RenderMenu()
{
   if (UI::MenuItem("Get Players in lobby")) {
      WriteFile();
   }
}

 
MwSArray<CGameNetPlayerInfo@> GetPlayers()
{

   return GetApp().Network.PlayerInfos;
}