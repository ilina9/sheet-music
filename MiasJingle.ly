\version "2.24.0"

#(set-global-staff-size 28)

\header {
  title = "Mia's Jingle"
  subtitle = \markup { \normal-text \italic "With love" }
  composer = "Ilina and Anton"
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")

  ragged-right = ##f

  markup-system-spacing.basic-distance = #15
  markup-system-spacing.padding = #5
}

rightHand = \absolute {
  \clef treble
  \override Score.MetronomeMark.padding = #4
  \tempo "Playfully" 4 = 100
  \key c \major
  \numericTimeSignature
  \time 4/4

  c'8-. d'-. e'-. f'-. g'4 d'-. |
  s4 s8 d'8-. c'4 r4 |
}

leftHand = \absolute {
  \clef bass
  \key c \major
  \time 4/4

  s1 |
  g4-. b8-. s8 s2 |
}

rightLabels = \lyricmode {
  C8 D8 E8 F8 G4 D4
  \skip 4 \skip 8 D8 C4 \skip 4
}

leftLabels = \lyricmode {
  \skip 1
  G4 B8 \skip 8 \skip 2
}

\score {
  \new PianoStaff <<

    % TREBLE STAFF

    \new Staff = "right" {
      \rightHand
    }

    % TREBLE NOTE LABELS

    \new Lyrics \with {
      alignBelowContext = "right"

      \override LyricText.font-size = #3
      \override LyricText.font-series = #'bold

      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5)
           (minimum-distance . 3)
           (padding . 2))
    } {
      \rightLabels
    }

    % BASS STAFF

    \new Staff = "left" {
      \leftHand
    }

    % BASS NOTE LABELS

    \new Lyrics \with {
      alignBelowContext = "left"

      \override LyricText.font-size = #3
      \override LyricText.font-series = #'bold

      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5)
           (minimum-distance . 3)
           (padding . 2))
    } {
      \leftLabels
    }

  >>

  \layout {
    \context {
      \Score
      \override SpacingSpanner.spacing-increment = #3
    }

    \context {
      \Staff
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 14)
           (minimum-distance . 10)
           (padding . 3))
    }
  }

  \midi { }
}