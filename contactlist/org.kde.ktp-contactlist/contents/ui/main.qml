/***************************************************************************
 *   Copyright (C) 2011 by Francesco Nwokeka <francesco.nwokeka@gmail.com> *
 *   Copyright (C) 2014 by Aleix Pol Gonzalez <aleixpol@kde.org>           *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA            *
 ***************************************************************************/

import QtQuick 2.1
import org.kde.telepathy 0.1 as KTp
import org.kde.plasma.plasmoid 2.0

Item
{
    id: root

    Plasmoid.switchWidth: 200
    Plasmoid.switchHeight: 300

    Plasmoid.fullRepresentation: ContactList {}
    Plasmoid.compactRepresentation: Presence {
        source: ktpPresence.currentPresenceIcon
    }


    KTp.GlobalPresence {
        id: ktpPresence
        accountManager: telepathyManager.accountManager
    }
    Component.onCompleted: {
        telepathyManager.addContactListFeatures();
        telepathyManager.becomeReady();
    }
}
