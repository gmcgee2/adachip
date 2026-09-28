with Interfaces; use Interfaces;

package Chip8 is
   type Byte is new Unsigned_8;
   type Word is new Unsigned_16;

   type Memory_Array is array (0 .. 4095) of Byte;
   type V_Array is array (0 .. 15) of Byte;
   type Stack_Array is array (0 .. 15) of Word;
   type Display_Array is array (0 .. 2047) of Boolean;
   type Keypad_Array is array (0 .. 15) of Boolean;

   type c8 is record
      Memory : Memory_Array := (others => 0);
      V : V_Array := (others => 0);
      I : Word := 0;
      PC : Word := 16#200#;
      Stack : Stack_Array := (others => 0);
      Stack_Ptr : Natural := 0;
      Display : Display_Array := (others => False);
      Opcode : Word := 0;
      Keypad : Keypad_Array := (others => False);
   end record;

   procedure Initialize (Chip : out c8);
end Chip8;
