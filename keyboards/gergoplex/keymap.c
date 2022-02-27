/* Good on you for modifying your layout! if you don't have
 * time to read the QMK docs, a list of keycodes can be found at
 *
 * https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md
 *
 * There's also a template for adding new layers at the bottom of this file!
 */

#define HR_Q MT(MOD_LCTL, FR_Q)
#define HR_S MT(MOD_LSFT, FR_S)
#define HR_D LT(SYMB, FR_D)
#define HR_F LT(DIAC, FR_F)

#define HR_J LT(DIAC, FR_J)
#define HR_K LT(SYMB, FR_K)
#define HR_L MT(MOD_RSFT, FR_L)
#define HR_M MT(MOD_RCTL, FR_M)

#include "keymap_french.h"

#define BASE 0 // default layer
#define SYMB 1 // symbols
#define DIAC 4 // diacritics
#define FNCT 2 // functions/motion (FUNC is already taken)
#define NAV 3 // navigation

#include QMK_KEYBOARD_H
#include "g/keymap_combo.h"

#define FR_CIR2 ALGR(FR_CCED)

#define UC_NTLD UC(0x00F1)

/* Combomap
 *
 * ,-----------------------------.       ,--------------------------------.
 * |      |    ESC    |     |     |      |     |    ESC    |    BSLH      |
 * |-----+-----+-----+-----+------|      |--------------------------------|
 * |      |   BSPC   ENT    |     |      |    LES   COLN  GRT    |        |
 * |-----+-----+-----+--RMB+-LMB--+      |--------------------------------|
 * |      |   MINS    |     |     |      |    QUO   UNDR   |     |        |
 * `------+-----+-----+------+----'      `--------------------------------'
 *  .-------------------------.           .-----------------.
 *  |        |       |        |           |        |    |   |
 *  '-------------------------'           '-----------------'
 */

// Blank template at the bottom
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    // clang-format off

    /* Keymap 0: Basic layer
     *
     * ,-----------------------------.       ,--------------------------------.
     * |    A |  Z  |  E  |  R  |  T  |      |  Y  |  U  |  I  |  O  |    P   |
     * |-----+-----+-----+-----+------|      |--------------------------------|
     * |     Q|  S  |  D  |  F  |  G  |      |  H  |  J  |  K  |  L  |      M |
     * |-----+-----+-----+-----+------+      |--------------------------------|
     * |     W|  X  |  C  |  V  |  B  |      |  N  | , ? | ; . | : / |      ! |
     * `------+-----+-----+------+----'      `--------------------------------'
     *  .-------------------------.           .-----------------.
     *  |  META  | ' /ALT|SPC(SYM)|           |ENT(NUM)|NAV|DIA|
     *  '-------------------------'           '-----------------'
     */

    [BASE] = LAYOUT_gergoplex(
            FR_A, FR_Z, FR_E, FR_R, FR_T, /*  */ FR_Y, FR_U,    FR_I,    FR_O,    FR_P,
            HR_Q, HR_S, HR_D, HR_F, FR_G, /*  */ FR_H, HR_J,    HR_K,    HR_L,    HR_M,
            FR_W, FR_X, FR_C, FR_V, FR_B, /*  */ FR_N, FR_COMM, FR_SCLN, FR_COLN, FR_EXLM,

            KC_LGUI,            MT(MOD_LALT, FR_QUOT), KC_SPC, // Left
            //LT(SYMB, KC_ENT), LT(NUMB, KC_BSPC),     MO(NAV) // Right
            LT(FNCT, KC_ENTER), KC_BSPC,               KC_RGUI // Right
    ),

    /* Keymap 1: Numpad / Symbols layer
     * ,----------------------------.       ,------------------------------.
     * |  1  |  2  |  3  |  -  |  \  |      |  ~  |  ^  |  <  |  >  |  $   |
     * |-----------------------------|      |--@-----_-----(-----)---------|
     * |  4  |  5  |  6  |  *  |  +  |      |  `  |  '  |  {  |  }  |  "   |
     * |-----------------------------|      |------------------------------|
     * |  7  |  8  |  9  |  =  |  %  |      |  #  |  &  |  [  |  ]  |  |   |
     * `-----------------------------'      `------------------------------'
     *          .-----------------.           .------------------.
     *          |    |  0  |      |           |     |     |      |
     *          '-----------------'           '------------------'
     * ,----------------------------.       ,------------------------------.
     * |  1  |  2  |  3  |  4  |  5  |      |  6  |  7  |  8  |  9  |  0   |
     * |-----------------------------|      |--@-----(-----)-----_---------|
     * |  =  |  <  |  >  |  -  |  +  |      |  #  |  {  |  }  |  "  |  $   |
     * |-----------------------------|      |------------------------------|
     * |  %  |  &  |  |  |  *  |  \  |      |  ~  |  [  |  ]  |  ^  |  `   |
     * `-----------------------------'      `------------------------------'
     *          .-----------------.           .------------------.
     *          |    |     |      |           |     |     |      |
     *          '-----------------'           '------------------'
     * |  à  |  è  |  ù  |  ^  |  ¨  |      |  ç  |     |     |     |      |
     */
    [SYMB] = LAYOUT_gergoplex(
            FR_1,    FR_2,    FR_3,    FR_4,    FR_5,    /*  */ FR_6,    FR_7,    FR_8,    FR_9,    FR_0,
            FR_EQL,  FR_LABK, FR_RABK, FR_MINS, FR_PLUS, /*  */ FR_HASH, FR_LCBR, FR_RCBR, FR_DQUO, FR_DLR,
            FR_PERC, FR_AMPR, FR_PIPE, FR_ASTR, FR_BSLS, /*  */ FR_TILD, FR_LBRC, FR_RBRC, FR_CIR2, FR_GRV,
     //       FR_AGRV, FR_EGRV, FR_UGRV, FR_CIRC, FR_DIAE, /*  */ FR_CCED, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
     //
            KC_TRNS, KC_TRNS, KC_TRNS, // Left
            KC_TRNS, KC_TRNS, KC_TRNS  // Right
            ),

    /* Keymap 4: Diacritics/numpad layer
     * ,-----------------------------.       ,------------------------------.
     * |  à   |  é  |  è  |  ù  |  n  |      |  +  |  1  |  2  |  3  |  *   |
     * |-----+-----+-----+-----+------|      |--.---------------------------|
     * |      |     |     |  ^  |  ¨  |      |  -  |  4  |  5  |  6  |  /   |
     * |-----+-----+-----+-----+------+      |------------------------------|
     * |  ^   |  ¨  |  ç  |  ^  |  ¨  |      |  0  |  7  |  8  |  9  |  %   |
     * `------+-----+-----+------+----'      `------------------------------'
     *          .-----------------.           .-----------------.
     *          |     |    |      |           |     |     |     |
     *          '-----------------'           '-----------------'
     */
    [DIAC] = LAYOUT_gergoplex(
            FR_AGRV, FR_EACU, FR_EGRV, FR_UGRV, UC_NTLD, /*  */ FR_PLUS, FR_1, FR_2, FR_3, FR_ASTR,
            XXXXXXX, XXXXXXX, XXXXXXX, FR_CIRC, FR_DIAE, /*  */ FR_MINS, FR_4, FR_5, FR_6, FR_SLSH,
            FR_CIRC, FR_DIAE, FR_CCED, FR_CIRC, FR_DIAE, /*  */ FR_0,    FR_7, FR_8, FR_9, FR_PERC,

            _______, _______, _______, // Left
            _______, _______, _______  // Right
            ),

    /* Keymap 2: Function layer
     * ,-----------------------------.       ,------------------------------.
     * |  à   |  é  |  è  |  ù  |  n  |      | MUTE| VDWN| VUP | BDWN| BUP  |
     * |-----+-----+-----+-----+------|      |------------------------------|
     * |      |     |     |  ^  |  ¨  |      | LFT | DWN | UP  | RGT | PGUP |
     * |-----+-----+-----+-----+------+      |------------------------------|
     * |  ^   |  ¨  |  ç  |  ^  |  ¨  |      | MLFT| MDWN| MUP | MRGT| PGDN |
     * `------+-----+-----+------+----'      `------------------------------'
     *          .-----------------.           .-----------------.
     *          | M3  | M2 | M1   |           |     |     |     |
     *          '-----------------'           '-----------------'
     */
    [FNCT] = LAYOUT_gergoplex(
            FR_AGRV, FR_EACU, FR_EGRV, FR_UGRV, UC_NTLD, /*  */ KC_MUTE, KC_VOLD, KC_VOLU, KC_BRID, KC_BRIU,
            XXXXXXX, XXXXXXX, XXXXXXX, FR_CIRC, FR_DIAE, /*  */ KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_PGUP,
            FR_CIRC, FR_DIAE, FR_CCED, FR_CIRC, FR_DIAE, /*  */ KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_PGDOWN,

            KC_BTN3, KC_BTN2, KC_BTN1, // Left
            KC_TRNS, KC_TRNS, KC_TRNS  // Right
            ),

    /* Keymap 3: Navigation layer
     * ,-----------------------------.       ,-------------------------------.
     * |      |     |     |     |     |      | MUTE| VDWN| VUP | BDWN| BUP  |
     * |-----+-----+-----+-----+------|      |-------------------------------|
     * |  F1  | F2  | F3  | F4  |  F5 |      | LFT | DWN | UP  | RGT | VOLUP |
     * |-----+-----+-----+-----+------+      |-------------------------------|
     * |  F6  | F7  | F8  | F9  | F10 |      |MLFT | MDWN| MUP | MRGT| VOLDN |
     * `------+-----+-----+------+----'      `-------------------------------'
     *          .-----------------.           .-----------------.
     *          | F11 | F12|      |           |     | PLY | SKP |
     *          '-----------------'           '-----------------'
     */
    [NAV] = LAYOUT_gergoplex(
            XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, /*  */ KC_MUTE, KC_VOLD, KC_VOLU, KC_BRID, KC_BRIU,
            KC_F1,   KC_F2,   KC_F3,   KC_F4,    KC_F5,   /*  */ KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_VOLU,
            KC_F6,   KC_F7,   KC_F8,   KC_F9,    KC_F10,  /*  */ KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_VOLD,

            KC_F11,  KC_F12,  XXXXXXX,
            XXXXXXX, XXXXXXX, XXXXXXX
            ),
    // clang-format on
};
