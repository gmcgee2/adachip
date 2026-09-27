with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System; use System;

package SDL3_Binds is
   subtype Bool is C_bool;
   subtype Window_Ptr is Address;
   subtype Renderer_Ptr is Address;
   subtype Texture_Ptr is Address;

   --  Init flags
   SDL_INIT_VIDEO : constant Unsigned_32 := 16#0000_0020#;

   function SDL_Init (Flags : Unsigned_32) return Bool
   with Import => True, Convention => C, External_Name => "SDL_Init";

   --  Create
   function SDL_CreateWindow (
      Title : chars_ptr;
      W, H : int;
      Flags : Unsigned_32)
      return Window_Ptr
      with Import => True, Convention => C,
      External_Name => "SDL_CreateWindow";

   function SDL_CreateRenderer (
      Window : Window_Ptr;
      Name : chars_ptr)
      return Renderer_Ptr
      with Import => True, Convention => C,
      External_Name => "SDL_CreateRenderer";

   function SDL_CreateTexture (
      Renderer : Renderer_Ptr;
      PixelFormat : Unsigned_32;
      TextureAccess : int;
      W, H : int)
      return Texture_Ptr
      with Import => True, Convention => C,
      External_Name => "SDL_CreateTexture";

   --  Destroy
   procedure SDL_DestroyWindow (
      Window : Window_Ptr)
      with Import => True, Convention => C,
      External_Name => "SDL_DestroyWindow";

   procedure SDL_DestroyRenderer (
      Renderer : Renderer_Ptr)
      with Import => True, Convention => C,
      External_Name => "SDL_DestroyRenderer";

   procedure SDL_DestroyTexture (
      Texture : Texture_Ptr)
      with Import => True, Convention => C,
      External_Name => "SDL_DestroyTexture";

   --  Quit
   procedure SDL_Quit
      with Import => True, Convention => C,
      External_Name => "SDL_Quit";

end SDL3_Binds;
