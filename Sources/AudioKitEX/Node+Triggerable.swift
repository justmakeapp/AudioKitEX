// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit
import AVFoundation

/// To allow nodes to be triggered
public protocol Triggerable {
    /// Trigger the sound with current parameters
    func trigger()
}

public extension Node where Self: Triggerable {
    /// Trigger the sound with current parameters
    func trigger() {
        au.trigger()
    }
}

/// To allow nodes to be gated
public protocol Gated {
    /// Start the gate
    func openGate()
    /// Stop the gate
    func closeGate()
}

public extension Node where Self: Gated {
    /// Start the gate
    func openGate() {
        au.trigger()
    }

    /// Stop the gate
    func closeGate() {
        au.detrigger()
    }
}

/// To allow nodes to be triggered via MIDI info
public protocol MIDITriggerable {
    /// Trigger the sound with a set of parameters
    ///
    /// - Parameters:
    ///   - note: MIDI note number
    ///   - velocity: Amplitude or volume expressed as a MIDI Velocity 0-127
    ///
    func trigger(note: MIDINoteNumber, velocity: MIDIVelocity)
}

public extension Node where Self: MIDITriggerable {
    /// Trigger the sound with a set of parameters
    ///
    /// - Parameters:
    ///   - note: MIDI note number
    ///   - velocity: Amplitude or volume expressed as a MIDI Velocity 0-127
    ///
    func trigger(note: MIDINoteNumber, velocity: MIDIVelocity = 127) {
        start()
        au.trigger(note: note, velocity: velocity)
    }
}
