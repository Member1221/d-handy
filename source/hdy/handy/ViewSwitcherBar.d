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
module handy.ViewSwitcherBar;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Stack;
private import handy.c.functions;
public  import handy.c.types;


/** */
public class ViewSwitcherBar : Bin
{
	/** the main Gtk struct */
	protected HdyViewSwitcherBar* hdyViewSwitcherBar;

	/** Get the main Gtk struct */
	public HdyViewSwitcherBar* getViewSwitcherBarStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return hdyViewSwitcherBar;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)hdyViewSwitcherBar;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (HdyViewSwitcherBar* hdyViewSwitcherBar, bool ownedRef = false)
	{
		this.hdyViewSwitcherBar = hdyViewSwitcherBar;
		super(cast(GtkBin*)hdyViewSwitcherBar, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return hdy_view_switcher_bar_get_type();
	}

	/**
	 * Creates a new #HdyViewSwitcherBar widget.
	 *
	 * Returns: a new #HdyViewSwitcherBar
	 *
	 * Since: 0.0.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = hdy_view_switcher_bar_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(HdyViewSwitcherBar*) p);
	}

	/**
	 * Get the icon size of the images used in the #HdyViewSwitcher.
	 *
	 * Returns: the icon size of the images
	 *
	 * Since: 0.0.10
	 */
	public GtkIconSize getIconSize()
	{
		return hdy_view_switcher_bar_get_icon_size(hdyViewSwitcherBar);
	}

	/**
	 * Gets the policy of @self.
	 *
	 * Returns: the policy of @self
	 *
	 * Since: 0.0.10
	 */
	public HdyViewSwitcherPolicy getPolicy()
	{
		return hdy_view_switcher_bar_get_policy(hdyViewSwitcherBar);
	}

	/**
	 * Gets whether @self should be revealed or not.
	 *
	 * Returns: %TRUE if @self is revealed, %FALSE if not.
	 *
	 * Since: 0.0.10
	 */
	public bool getReveal()
	{
		return hdy_view_switcher_bar_get_reveal(hdyViewSwitcherBar) != 0;
	}

	/**
	 * Get the #GtkStack being controlled by the #HdyViewSwitcher.
	 *
	 * Returns: the #GtkStack, or %NULL if none has been set
	 *
	 * Since: 0.0.10
	 */
	public Stack getStack()
	{
		auto p = hdy_view_switcher_bar_get_stack(hdyViewSwitcherBar);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Stack)(cast(GtkStack*) p);
	}

	/**
	 * Change the icon size hint for the icons in a #HdyViewSwitcher.
	 *
	 * Params:
	 *     iconSize = the new icon size
	 *
	 * Since: 0.0.10
	 */
	public void setIconSize(GtkIconSize iconSize)
	{
		hdy_view_switcher_bar_set_icon_size(hdyViewSwitcherBar, iconSize);
	}

	/**
	 * Sets the policy of @self.
	 *
	 * Params:
	 *     policy = the new policy
	 *
	 * Since: 0.0.10
	 */
	public void setPolicy(HdyViewSwitcherPolicy policy)
	{
		hdy_view_switcher_bar_set_policy(hdyViewSwitcherBar, policy);
	}

	/**
	 * Sets whether @self should be revealed or not.
	 *
	 * Params:
	 *     reveal = %TRUE to reveal @self
	 *
	 * Since: 0.0.10
	 */
	public void setReveal(bool reveal)
	{
		hdy_view_switcher_bar_set_reveal(hdyViewSwitcherBar, reveal);
	}

	/**
	 * Sets the #GtkStack to control.
	 *
	 * Params:
	 *     stack = a #GtkStack
	 *
	 * Since: 0.0.10
	 */
	public void setStack(Stack stack)
	{
		hdy_view_switcher_bar_set_stack(hdyViewSwitcherBar, (stack is null) ? null : stack.getStackStruct());
	}
}
