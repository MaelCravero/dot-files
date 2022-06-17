#include "keymap_french.h"
#define FR_CIR2 ALGR(FR_CCED)

#include "features/custom_shift_keys.h"

//------------------------------------------------------------------//
//                       Home row shorthands                        //
//------------------------------------------------------------------//

// Azerty
#define HR_Q LCTL_T(FR_Q)
#define HR_S LSFT_T(FR_S)
#define HR_D LT(NUMP, FR_D)
#define HR_F LALT_T(FR_F)

#define HR_J LALT_T(FR_J)
#define HR_K LT(NUMP, FR_K)
#define HR_L RSFT_T(FR_L)
#define HR_M RCTL_T(FR_M)

// Colemak-bepo
#define HR_A LCTL_T(FR_A)
#define HR_R LSFT_T(FR_R)
#define COHR_S LT(NUMP, FR_S)
#define HR_T LALT_T(FR_T)

#define HR_N LALT_T(FR_N)
#define HR_E LT(NUMP, FR_E)
#define HR_I RSFT_T(FR_I)
#define HR_O RCTL_T(FR_O)

//------------------------------------------------------------------//
//                           Custom hold                            //
//------------------------------------------------------------------//

#define SH_LPRN LT(0, FR_LPRN)
#define SH_RPRN LT(0, FR_RPRN)

#define SH_SCLN LT(0, FR_SCLN)
#define SH_COLN LT(0, FR_COLN)
#define SH_COMM LT(0, FR_COMM)
#define SH_QUOT LT(0, FR_QUOT)
#define SH_SHFT OSM(MOD_LSFT)

typedef struct
{
    uint16_t keycode;
    uint16_t hold_keycode;
} custom_hold_key_t;

const custom_hold_key_t custom_hold_keys[] = {
    // clang-format off
    {SH_LPRN, FR_LBRC},
    {SH_RPRN, FR_RBRC},
    {SH_COMM, FR_DQUO},
    {SH_SCLN, FR_TILD},
    {SH_COLN, FR_BSLS},
    {SH_QUOT, FR_DLR },
    {SH_SHFT, KC_CAPS},
    // clang-format on
};

uint8_t NUM_CUSTOM_HOLD_KEYS =
    sizeof(custom_hold_keys) / sizeof(custom_hold_key_t);

//------------------------------------------------------------------//
//                           Custom shift                           //
//------------------------------------------------------------------//

const custom_shift_key_t custom_shift_keys[] = {
    // clang-format off
    {SH_COMM, FR_QUES},
    {SH_SCLN, FR_DOT },
    {SH_COLN, FR_SLSH},
    {SH_QUOT, FR_EXLM},
    {SH_LPRN, FR_LCBR},
    {SH_RPRN, FR_RCBR},
    {FR_UNDS, FR_MINS},
    // clang-format on
};

uint8_t NUM_CUSTOM_SHIFT_KEYS =
    sizeof(custom_shift_keys) / sizeof(custom_shift_key_t);

//------------------------------------------------------------------//
//                              Layers                              //
//------------------------------------------------------------------//

#define BASE 0 // default (azerty) layer
#define COLE 1 // colemak-dh
#define NUMP 2 // symbols/numpad
#define FNCT 3 // functions/motion (FUNC is already taken)

#include QMK_KEYBOARD_H
#include "g/keymap_combo.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    // clang-format off

    /* Keymap 0: Basic layer
     *
     * ,-----------------------------.       ,--------------------------------.
     * |    A |  Z  |  E  |  R  |  T  |      |  Y  |  U  |  I  |  O  |    P   |
     * |-----+-----+-----+-----+------|      |--------------------------------|
     * |     Q|  S  |  D  |  F  |  G  |      |  H  |  J  |  K  |  L  |      M |
     * |-----+-----+-----+-----+------+      |--------------------------------|
     * |     W|  X  |  C  |  V  |  B  |      |  N  | , ? | ; . | : / |  ' !   |
     * `------+-----+-----+------+----'      `--------------------------------'
     *  .-------------------------.           .-----------------.
     *  |  META  | CAPS  |   SPC  |           |ENT(NAV)|BSP|NUMP|
     *  '-------------------------'           '-----------------'
     */

    [BASE] = LAYOUT_gergoplex(
            FR_A, FR_Z, FR_E, FR_R, FR_T, /*  */ FR_Y, FR_U,    FR_I,    FR_O,    FR_P,
            HR_Q, HR_S, HR_D, HR_F, FR_G, /*  */ FR_H, HR_J,    HR_K,    HR_L,    HR_M,
            FR_W, FR_X, FR_C, FR_V, FR_B, /*  */ FR_N, SH_COMM, SH_SCLN, SH_COLN, SH_QUOT,

            KC_LGUI,            SH_SHFT, KC_SPC,  // Left
            LT(FNCT, KC_ENTER), KC_BSPC, DF(NUMP) // Right
    ),

    /* Keymap 1: Colemak-dh layer
     *
     * ,-----------------------------.       ,--------------------------------.
     * |   Q  |  W  |  F  |  P  |  B  |      |  J  |  H  |  U  |  Y  |   '    |
     * |-----+-----+-----+-----+------|      |--------------------------------|
     * |    A |  R  |  S  |  T  |  G  |      |  M  |  N  |  E  |  I  |    O   |
     * |-----+-----+-----+-----+------+      |--------------------------------|
     * |   Z  |  X  |  C  |  D  |  V  |      |  K  |  L  |  ;  |  :  |   ,    |
     * `------+-----+-----+------+----'      `--------------------------------'
     *  .-------------------------.           .-----------------.
     *  |  META  | ' /ALT|   SPC  |           |ENT(NAV)|BSP|META|
     *  '-------------------------'           '-----------------'
     */

    [COLE] = LAYOUT_gergoplex(
            FR_Q, FR_W, FR_F, FR_P, FR_B,   /*  */ FR_J, FR_H, FR_U,    FR_Y,    SH_QUOT,
            HR_A, HR_R, COHR_S, HR_T, FR_G, /*  */ FR_M, HR_N, HR_E,    HR_I,    HR_O,
            FR_Z, FR_X, FR_C, FR_D, FR_V,   /*  */ FR_K, FR_L, SH_SCLN, SH_COLN, SH_COMM,

            KC_LGUI,            KC_CAPS, KC_SPC,  // Left
            LT(FNCT, KC_ENTER), KC_BSPC, DF(BASE) // Right
    ),

    /* Keymap 2: Symbols/numpad layer
     *
     * ,-----------------------------.       ,------------------------------.
     * |   &  |  "  |  ~  |  |  |     |      |  .  |  7  |  8  |  9  |  ^   |
     * |-----+-----+-----+-----+------|      |------------------------------|
     * |   =  |  <  |  >  |  -  |  +  |      |  #  |  4  |  5  |  6  |  0   |
     * |-----+-----+-----+-----+------+      |------------------------------|
     * |   %  |     |     |  *  |  \  |      |  `  |  1  |  2  |  3  |  $   |
     * `------+-----+-----+------+----'      `------------------------------'
     *          .-----------------.           .-----------------.
     *          |     |    |      |           |     |     |     |
     *          '-----------------'           '-----------------'
     */
    [NUMP] = LAYOUT_gergoplex(
            FR_AMPR, FR_DQUO, FR_TILD, FR_PIPE, FR_SLSH, /*  */ FR_DOT,  FR_7, FR_8, FR_9, FR_CIR2,
            FR_EQL,  FR_LABK, FR_RABK, FR_MINS, FR_PLUS, /*  */ FR_HASH, FR_4, FR_5, FR_6, FR_0,
            FR_PERC, FR_LBRC, FR_RBRC, FR_ASTR, FR_BSLS, /*  */ FR_GRV,  FR_1, FR_2, FR_3, FR_DLR,

            DF(BASE), _______, _______, // Left
            _______, _______, DF(BASE) // Right
            ),

    /* Keymap 3: Navigation layer
     * ,-----------------------------.       ,-------------------------------.
     * |  F1  | F2  | F3  | F4  |  F5 |      | MUTE| VDWN| VUP | BDWN| BUP   |
     * |-----+-----+-----+-----+------|      |-------------------------------|
     * |  F6  | F7  | F8  | F9  | F10 |      | LFT | DWN | UP  | RGT | PG UP |
     * |-----+-----+-----+-----+------+      |-------------------------------|
     * |  F11 | F12 | COLE| BASE| PSCR|      |MLFT | MDWN| MUP | MRGT| PG DN |
     * `------+-----+-----+------+----'      `-------------------------------'
     *          .-----------------.           .-----------------.
     *          | M3  | M2 |  M1  |           |     |     |     |
     *          '-----------------'           '-----------------'
     */
    [FNCT] = LAYOUT_gergoplex(
            KC_F1,   KC_F2,   KC_F3,   KC_F4,    KC_F5,   /*  */ KC_MUTE, KC_VOLD, KC_VOLU, KC_BRID, KC_BRIU,
            KC_F6,   KC_F7,   KC_F8,   KC_F9,    KC_F10,  /*  */ KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_PGUP,
            KC_F11,  KC_F12,  DF(COLE), XXXXXXX,  KC_PSCR, /*  */ KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_PGDN,

            KC_BTN3, KC_BTN2, KC_BTN1,
            _______, _______, _______
            ),
    // clang-format on
};

//------------------------------------------------------------------//
//                           Custom code                            //
//------------------------------------------------------------------//

bool caps = false;

bool interrupt_caps(uint16_t keycode, keyrecord_t* record)
{
    if (!record->event.pressed)
        return false;

    switch (keycode)
    {
    // Keycodes that continue Caps Word, without shifting.
    case KC_A ... KC_Z:
    case FR_1 ... FR_0:
    case KC_BSPC:
    case KC_DEL:
    case FR_UNDS:
    case FR_MINS:
    case KC_CAPS:
    case LT(NUMP, KC_BSPC):
        // Home row mods
    case HR_Q:
    case HR_S:
    case HR_D:
    case HR_F:
    case HR_J:
    case HR_K:
    case HR_L:
    case HR_M:
        // Home row mods (colemak)
    case HR_A:
    case HR_R:
    case COHR_S:
    case HR_T:
    case HR_N:
    case HR_E:
    case HR_I:
    case HR_O:
        return false;

    default:
        return true; // Deactivate Caps
    }
}

bool process_custom_hold_keys(uint16_t keycode, keyrecord_t* record)
{
    if (!record->tap.count && record->event.pressed)
    {
        for (int i = 0; i < NUM_CUSTOM_HOLD_KEYS; i++)
            if (keycode == custom_hold_keys[i].keycode)
            {
                tap_code16(custom_hold_keys[i].hold_keycode);

                if (custom_hold_keys[i].hold_keycode == KC_CAPS) {
                  caps = !caps;
                }

                return false;
            }
    }

    return true;
}

bool process_record_user(uint16_t keycode, keyrecord_t* record)
{
    if (caps && interrupt_caps(keycode, record))
    {
        tap_code16(KC_CAPS);
        caps = false;
    }

    if (!process_custom_hold_keys(keycode, record))
        return false;

    if (!process_custom_shift_keys(keycode, record))
        return false;

    switch (keycode)
    {
    case KC_CAPS:
        if (record->event.pressed)
        {
            caps = !caps;
        }
        return true;
    }
    return true;
}
