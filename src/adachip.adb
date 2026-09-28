with SDL3_Binds; use SDL3_Binds;
with Chip8; use Chip8;
with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;

procedure Adachip is
   Scale : constant := 30;
   Title : constant chars_ptr := New_String ("adachip");
   Window : Window_Ptr;
   Renderer : Renderer_Ptr;
   Texture : Texture_Ptr;

   Chip : c8;

begin
   Initialize (Chip);

   if SDL_Init (SDL_INIT_VIDEO) = False then
      Put_Line ("Init Failed.");
   end if;

   Window := SDL_CreateWindow (Title, 64 * Scale, 32 * Scale, 0);
   Renderer := SDL_CreateRenderer (Window, Null_Ptr);
   Texture := SDL_CreateTexture (Renderer, 16#1646_2004#, 1, 64, 32);

   delay 5.0;

   SDL_DestroyTexture (Texture);
   SDL_DestroyRenderer (Renderer);
   SDL_DestroyWindow (Window);
   SDL_Quit;
end Adachip;
