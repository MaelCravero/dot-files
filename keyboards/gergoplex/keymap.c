/* Good on you for modifying your layout! if you don't have
 * time to read the QMK docs, a list of keycodes can be found at
 *
 * https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md
 *
 * There's also a template for adding new layers at the bottom of this file!
 */

#define HR_Q MT(MOD_LCTL, FR_Q)
#define HR_S MT(MOD_LSFT, FR_S)
// #define HR_S FR_S
#define HR_D LT(NUMP, FR_D)
// #define HR_F LT(DIAC, FR_F)
// #define HR_D FR_D
// #define HR_F MOD(MOD_LGUI, FR_F)
#define HR_F FR_F

#define HR_J FR_J
// #define HR_J MOD(MOD_LGUI, FR_J)
// #define HR_K FR_K
// #define HR_J LT(DIAC, FR_J)
#define HR_K LT(NUMP, FR_K)
#define HR_L MT(MOD_RSFT, FR_L)
// #define HR_L FR_L
#define HR_M MT(MOD_RCTL, FR_M)

#include "keymap_french.h"

#define BASE 0 // default layer
#define SYMB 1 // symbols
#define NUMP 2 // numpad
#define FNCT 3 // functions/motion (FUNC is already taken)

#include QMK_KEYBOARD_H
#include "g/keymap_combo.h"

#define FR_CIR2 ALGR(FR_CCED)

#define UC_NTLD UC(0x00F1)
#define OS_SHFT OSM(MOD_RSFT)

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
     * |     W|  X  |  C  |  V  |  B  |      |  N  | , ? | ; . | : / |  SHIFT |
     * `------+-----+-----+------+----'      `--------------------------------'
     *  .-------------------------.           .-----------------.
     *  |  META  | ' /ALT|   SPC  |           |ENT(NAV)|BSP|META|
     *  '-------------------------'           '-----------------'
     */

    [BASE] = LAYOUT_gergoplex(
            FR_A, FR_Z, FR_E, FR_R, FR_T, /*  */ FR_Y, FR_U,    FR_I,    FR_O,    FR_P,
            HR_Q, HR_S, HR_D, HR_F, FR_G, /*  */ FR_H, HR_J,    HR_K,    HR_L,    HR_M,
            FR_W, FR_X, FR_C, FR_V, FR_B, /*  */ FR_N, FR_COMM, FR_SCLN, FR_COLN, OS_SHFT,

            KC_LGUI,            OSL(NUMP),         KC_SPC,  // Left
            LT(FNCT, KC_ENTER), LT(NUMP, KC_BSPC), KC_LALT // Right
    ),

    /* Keymap 1: Numpad / Symbols layer
     *
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

    /* Keymap 2: Diacritics/numpad layer
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
     *
     * ,-----------------------------.       ,------------------------------.
     * |   &  |  '  |  "  |  |  |  #  |      |  .  |  7  |  8  |  9  |  ^   |
     * |-----+-----+-----+-----+------|      |------------------------------|
     * |   =  |  <  |  >  |  -  |  +  |      |  ~  |  4  |  5  |  6  |  0   |
     * |-----+-----+-----+-----+------+      |------------------------------|
     * |   %  |  [  |  ]  |  *  |  \  |      |  `  |  1  |  2  |  3  |  $   |
     * `------+-----+-----+------+----'      `------------------------------'
     *          .-----------------.           .-----------------.
     *          |     |    |      |           |     |     |     |
     *          '-----------------'           '-----------------'
     */
    [NUMP] = LAYOUT_gergoplex(
            FR_AMPR, FR_QUOT, FR_DQUO, FR_PIPE, FR_HASH, /*  */ FR_DOT,  FR_7, FR_8, FR_9, FR_CIR2,
            FR_EQL,  FR_LABK, FR_RABK, FR_MINS, FR_PLUS, /*  */ FR_TILD, FR_4, FR_5, FR_6, FR_0,
            FR_PERC, FR_LBRC, FR_RBRC, FR_ASTR, FR_BSLS, /*  */ FR_GRV,  FR_1, FR_2, FR_3, FR_DLR,

            _______, _______, _______, // Left
            _______, _______, _______  // Right
            ),

    /* Keymap 3: Navigation layer
     * ,-----------------------------.       ,-------------------------------.
     * |  F1  | F2  | F3  | F4  |  F5 |      | MUTE| VDWN| VUP | BDWN| BUP   |
     * |-----+-----+-----+-----+------|      |-------------------------------|
     * |  F6  | F7  | F8  | F9  | F10 |      | LFT | DWN | UP  | RGT | PG UP |
     * |-----+-----+-----+-----+------+      |-------------------------------|
     * |  F11 | F12 |     |     | PSCR|      |MLFT | MDWN| MUP | MRGT| PG DN |
     * `------+-----+-----+------+----'      `-------------------------------'
     *          .-----------------.           .-----------------.
     *          | M3  | M2 |  M1  |           |     |     |     |
     *          '-----------------'           '-----------------'
     */
    [FNCT] = LAYOUT_gergoplex(
            KC_F1,   KC_F2,   KC_F3,   KC_F4,    KC_F5,   /*  */ KC_MUTE, KC_VOLD, KC_VOLU, KC_BRID, KC_BRIU,
            KC_F6,   KC_F7,   KC_F8,   KC_F9,    KC_F10,  /*  */ KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_PGUP,
            KC_F11,  KC_F12,  XXXXXXX, XXXXXXX,  KC_PSCR, /*  */ KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_PGDN,

            KC_BTN3, KC_BTN2, KC_BTN1,
            _______, _______, _______
            ),
    // clang-format on
};
