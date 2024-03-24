#include <iostream>

using namespace std;

class Character {
public:
    int herbs = 5;
    int manapot = 5;
    int hppot = 5;
    int swords[3] = {10, 30, 50};

    int equipedsword = 0;
    int hp = 100;
    int mana = 100;
    int dmg = swords[equipedsword];

    void useHerb() {
        if (herbs < 1) {
            cout << "Anda tidak memiliki herbs." << endl;
        } else if (hp >= 1000) {
            cout << "Anda tidak perlu menggunakan herbs." << endl;
        } else {
            herbs--;
            hp += 10;
            cout << "Anda menggunakan herbs. +10 HP" << endl;
        }
    }

    void useHpPot() {
        if (hppot < 1) {
            cout << "Anda tidak memiliki HP pot." << endl;
        } else if (hp >= 1000) {
            cout << "Anda tidak perlu menggunakan HP pot." << endl;
        } else {
            hppot--;
            hp += 50;
            cout << "Anda menggunakan HP pot. +50 HP" << endl;
        }
    }

    void useManaPot() {
        if (manapot < 1) {
            cout << "Anda tidak memiliki mana pot." << endl;
        } else if (mana >= 1000) {
            cout << "Anda tidak perlu menggunakan mana pot." << endl;
        } else {
            manapot--;
            mana += 50;
            cout << "Anda menggunakan mana pot. +50 mana" << endl;
        }
    }

    void changeSword(int a) {
        if (a >= 0 && a < 3) {
            dmg = swords[a];
            equipedsword = a;
            cout << "Anda mengganti pedang ke nomor " << a << ". DMG sekarang adalah " << dmg << endl;
        } else {
            cout << "Nomor pedang tidak valid." << endl;
        }
    }

    void showStat() {
        cout << "HP = " << hp << endl;
        cout << "Mana = " << mana << endl;
        cout << "DMG = " << dmg << endl;
        cout << "Pedang yang digunakan = " << equipedsword << endl << endl;
    }

    void showBag() {
        cout << "==== Inventory ====" << endl;
        cout << "Herbs = " << herbs << endl;
        cout << "Mana pot = " << manapot << endl;
        cout << "HP pot = " << hppot << endl << endl;
    }
};

int main() {
    Character mc;
    int choice;

    while (true) {
        cout << "Pilih aksi:" << endl;
        cout << "1. Gunakan Herb" << endl;
        cout << "2. Gunakan HP Pot" << endl;
        cout << "3. Gunakan Mana Pot" << endl;
        cout << "4. Ganti Pedang" << endl;
        cout << "5. Tampilkan Stat" << endl;
        cout << "6. Tampilkan Item" << endl;
        cout << "7. Keluar" << endl;
        cout << "Masukkan pilihan (1-7): ";
        cin >> choice;

        switch (choice) {
            case 1:
                mc.useHerb();
                break;
            case 2:
                mc.useHpPot();
                break;
            case 3:
                mc.useManaPot();
                break;
            case 4:
                int swordNumber;
                cout << "Masukkan nomor pedang (0-2): ";
                cin >> swordNumber;
                mc.changeSword(swordNumber);
                break;
            case 5:
                mc.showStat();
                break;
            case 6:
                mc.showBag();
                break;
            case 7:
                cout << "Keluar dari program." << endl;
                return 0;
            default:
                cout << "Pilihan tidak valid. Silakan coba lagi." << endl;
        }
    }
}
