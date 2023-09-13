using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ocho_Reinas
{
    internal class Program
    {

        static int[] tablero = new int[8];

        static void pintarTablero()
        {
            Console.WriteLine();
            for (int fila = 0; fila < 8; fila++)
            {
                for (int columna = 0; columna < 8; columna++)
                {
                    if (tablero[columna] == fila) Console.Write("* ");
                    else Console.Write(". ");
                }
                Console.WriteLine();
            }
            Console.ReadKey();
        }

        static bool tableroCorrecto(int columna)
        {
            for (int i = 0; i < columna; i++)
            {
                if (tablero[i] == tablero[columna]) return false;
                if (Math.Abs(columna - i) == Math.Abs(tablero[columna] - tablero[i])) return false;
            }
            return true;
        }

        static void colocarReina(int columna)
        {
            for (int fila = 0; fila < 8; fila++)
            {
                tablero[columna] = fila;
                if (tableroCorrecto(columna))
                {
                    if (columna == 7) pintarTablero();
                    else colocarReina(columna + 1);
                }
            }
        }
        static void Main(string[] args)
        {
            colocarReina(0);
            Console.ReadKey();
        }
    }
}
