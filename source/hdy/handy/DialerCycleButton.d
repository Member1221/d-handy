/*
 * This file is part of d-handy.
 *
 * d-handy is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * d-handy is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with d-handy; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
module handy.DialerCycleButton;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
private import handy.DialerButton;
private import handy.c.functions;
public  import handy.c.types;
private import std.algorithm;


/** */
public class DialerCycleButton : DialerButton
{
	/** the main Gtk struct */
	protected HdyDialerCycleButton* hdyDialerCycleButton;

	/** Get the main Gtk struct */
	public HdyDialerCycleButton* getDialerCycleButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return hdyDialerCycleButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)hdyDialerCycleButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (HdyDialerCycleButton* hdyDialerCycleButton, bool ownedRef = false)
	{
		this.hdyDialerCycleButton = hdyDialerCycleButton;
		super(cast(HdyDialerButton*)hdyDialerCycleButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return hdy_dialer_cycle_button_get_type();
	}

	/**
	 * Create a new #HdyDialerCycleButton which displays @symbols. The
	 * symbols can by cycled through by pressing the button multiple
	 * times.
	 *
	 * Params:
	 *     symbols = the symbols displayed on the #HdyDialerCycleButton
	 *
	 * Returns: the newly created #HdyDialerCycleButton widget
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string symbols)
	{
		auto p = hdy_dialer_cycle_button_new(Str.toStringz(symbols));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(HdyDialerCycleButton*) p);
	}

	/**
	 * Get the symbol the dialer should display
	 *
	 * Returns: a pointer to the symbol
	 */
	public dchar getCurrentSymbol()
	{
		return hdy_dialer_cycle_button_get_current_symbol(hdyDialerCycleButton);
	}

	/**
	 * Get the cycle timeout in milliseconds.
	 */
	public int getCycleTimeout()
	{
		return hdy_dialer_cycle_button_get_cycle_timeout(hdyDialerCycleButton);
	}

	/**
	 * Check whether the button is in cycling mode.
	 *
	 * Returns: #TRUE if the in cycling mode otherwise #FALSE
	 */
	public bool isCycling()
	{
		return hdy_dialer_cycle_button_is_cycling(hdyDialerCycleButton) != 0;
	}

	/**
	 * Set the cycle timeout in milliseconds.
	 *
	 * Params:
	 *     timeout = the timeout in milliseconds
	 */
	public void setCycleTimeout(int timeout)
	{
		hdy_dialer_cycle_button_set_cycle_timeout(hdyDialerCycleButton, timeout);
	}

	/**
	 * Stop the cycling mode.
	 */
	public void stopCycle()
	{
		hdy_dialer_cycle_button_stop_cycle(hdyDialerCycleButton);
	}

	/**
	 * This signal is emitted when the cycle ends. This can either be
	 * because of timeout or because #hdy_dialer_cycle_stop_cycle got
	 * called.
	 */
	gulong addOnCycleEnd(void delegate(DialerCycleButton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "cycle-end", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This signal is emitted when the button starts cycling (that is on
	 * the first button press).
	 */
	gulong addOnCycleStart(void delegate(DialerCycleButton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "cycle-start", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
